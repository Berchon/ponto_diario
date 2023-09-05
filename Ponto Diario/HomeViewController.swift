//
//  ViewController.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 30/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    let helper = Helper()
    
    var requiredDailyHours: TimeInterval = 5 * 3600
    var startWork: TimeInterval = 8 * 3600 + 0 * 60
    var lunchBreakTime: TimeInterval = 12 * 3600
    var lunchBreakDuration: TimeInterval = 1 * 3600
    
    var startWorkDatePickerLastValue = Date()
    var lunchTimeStartDatePickerLastValue = Date()
    var lunchTimeEndDatePickerLastValue = Date()
    var endWorkTimeDatePickerLastValue = Date()
    
    // MARK: UI Components reference
    @IBOutlet weak var overtimeDurationTextLabel: UILabel!
    @IBOutlet weak var workdayDurationValueLabel: UILabel!
    @IBOutlet weak var overtimeDurationValueLabel: UILabel!
    @IBOutlet weak var startWorkDatePicker: UIDatePicker!
    @IBOutlet weak var lunchTimeStartDatePicker: UIDatePicker!
    @IBOutlet weak var lunchTimeEndDatePicker: UIDatePicker!
    @IBOutlet weak var endWorkTimeDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startWorkDatePicker.contentHorizontalAlignment = .left
        lunchTimeStartDatePicker.contentHorizontalAlignment = .left
        lunchTimeEndDatePicker.contentHorizontalAlignment = .left
        endWorkTimeDatePicker.contentHorizontalAlignment = .left

        updateDatePickersWithConfiguration()
    }
    
    @IBAction func startWorkValueChanged(_ sender: Any) {
        let startWork = startWorkDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeStart = lunchTimeStartDatePicker.date.timeIntervalSinceReferenceDate
        
        if lunchTimeStart < startWork {
            startWorkDatePicker.date = startWorkDatePickerLastValue
            print("O horário de entrada no trabalho não pode ser maior que o horário de saída para o almoço!")
            return
        }
        
        updateDatePickers()
    }
    
    @IBAction func lunchTimeStartValueChanged(_ sender: Any) {
        let startWork = startWorkDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeStart = lunchTimeStartDatePicker.date.timeIntervalSinceReferenceDate
        
        if lunchTimeStart < startWork {
            lunchTimeStartDatePicker.date = lunchTimeStartDatePickerLastValue
            print("O horário de saída para o almoço não pode ser menor que o horário entradano trabalho!")
            return
        }
        
        updateDatePickers()
    }

    
    @IBAction func lunchTimeEndValueChanged(_ sender: Any) {
        let startWork = startWorkDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeStart = lunchTimeStartDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeEnd = lunchTimeEndDatePicker.date.timeIntervalSinceReferenceDate
        
        if lunchTimeEnd < lunchTimeStart {
            lunchTimeEndDatePicker.date = lunchTimeEndDatePickerLastValue
            print("O horário de retorno do almoço não pode ser menor que o horário de saída para o almoço!")
            return
        }
        let lunchDuration = lunchTimeEnd - lunchTimeStart
        var endWork = startWork + requiredDailyHours + lunchDuration

        let morningWorkDuration = lunchTimeStart - startWork
        if morningWorkDuration >= requiredDailyHours {
            endWork = lunchTimeEnd
        }
        endWorkTimeDatePicker.date = Date(timeIntervalSinceReferenceDate: endWork)
    }

    @IBAction func endWorkValueChanged(_ sender: Any) {
        let lunchTimeEnd = lunchTimeEndDatePicker.date.timeIntervalSinceReferenceDate
        var endWork = endWorkTimeDatePicker.date.timeIntervalSinceReferenceDate
        if endWork < lunchTimeEnd {
            endWorkTimeDatePicker.date = endWorkTimeDatePickerLastValue
            print("O horário de saída não pode ser menor que o horário de retorno do almoço!")
            return
        }
        endWorkTimeDatePickerLastValue = endWorkTimeDatePicker.date
    }
    
    @IBAction func calculateTotalWorkTime(_ sender: Any) {
        let startWork = startWorkDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeStart = lunchTimeStartDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeEnd = lunchTimeEndDatePicker.date.timeIntervalSinceReferenceDate
        var endWork = endWorkTimeDatePicker.date.timeIntervalSinceReferenceDate
        
        let workday = (endWork - lunchTimeEnd) + (lunchTimeStart - startWork)
        print(workday)
        let overtime = workday - requiredDailyHours
        workdayDurationValueLabel.text = helper.timeIntervalToHHmm(using: workday)
        if Int(overtime) == 0 {
            overtimeDurationTextLabel.isHidden = true
            overtimeDurationValueLabel.isHidden = true
            return
        }
        overtimeDurationTextLabel.isHidden = false
        overtimeDurationValueLabel.isHidden = false
        
        let text = overtime > 0 ? "Horas extras:" : "Horas não trabalhadas:"
        overtimeDurationTextLabel.text = text
        overtimeDurationValueLabel.text = helper.timeIntervalToHHmm(using: abs(overtime))

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfigurationViewController {
            destination.delegate = self
            destination.requiredDailyHours = requiredDailyHours
            destination.startWork = startWork
            destination.lunchBreakTime = lunchBreakTime
            destination.lunchBreakDuration = lunchBreakDuration
        }
    }

    func updateDatePickers() {
        let startWork = startWorkDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeStart = lunchTimeStartDatePicker.date.timeIntervalSinceReferenceDate
        var lunchTimeEnd = lunchTimeStart + lunchBreakDuration
        var endWork = startWork + requiredDailyHours + lunchBreakDuration

        let morningWorkDuration = lunchTimeStart - startWork
        if morningWorkDuration >= requiredDailyHours {
            lunchTimeEnd = lunchTimeStart
            endWork = lunchTimeStart
        }
        
        lunchTimeEndDatePicker.date = Date(timeIntervalSinceReferenceDate: lunchTimeEnd)
        endWorkTimeDatePicker.date = Date(timeIntervalSinceReferenceDate: endWork)
        
        updateLastValuesProperties()
    }
    
    func updateDatePickersWithConfiguration() {
        let lunchTimeEnd = lunchBreakTime + lunchBreakDuration
        let endWork = startWork + requiredDailyHours + lunchBreakDuration
        
        startWorkDatePicker.date = helper.todayDate(with: startWork)
        lunchTimeStartDatePicker.date = helper.todayDate(with: lunchBreakTime)
        lunchTimeEndDatePicker.date = helper.todayDate(with: lunchTimeEnd)
        endWorkTimeDatePicker.date = helper.todayDate(with: endWork)
        
        updateLastValuesProperties()
    }
    
    func updateLastValuesProperties() {
        startWorkDatePickerLastValue = startWorkDatePicker.date
        lunchTimeStartDatePickerLastValue = lunchTimeStartDatePicker.date
        lunchTimeEndDatePickerLastValue = lunchTimeEndDatePicker.date
        endWorkTimeDatePickerLastValue = endWorkTimeDatePicker.date
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func updateDataSource(requiredDailyHours: TimeInterval, startWork: TimeInterval, lunchBreakTime: TimeInterval, lunchBreakDuration: TimeInterval) {
        self.requiredDailyHours = requiredDailyHours
        self.startWork = startWork
        self.lunchBreakTime = lunchBreakTime
        self.lunchBreakDuration = lunchBreakDuration
        updateDatePickersWithConfiguration()
    }
}
