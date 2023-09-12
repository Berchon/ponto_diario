//
//  ViewController.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 30/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // TODO: Persistence data
    // TODO: Message Snackbar
    // TODO: fix alerts messages
    
    // MARK: Properties
    let helper = Helper()
    
    var configuration: ConfigurationModel = ConfigurationModel(
        requiredDailyHours: 8 * 3600,
        startWork: 8 * 3600,
        lunchBreakTime: 12 * 3600,
        lunchBreakDuration: 1 * 3600
    )
    
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
        calculateTotalWorkTime(String())
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
            print("O horário de saída para o almoço não pode ser menor que o horário entrada no trabalho!")
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
        var endWork = startWork + configuration.requiredDailyHours + lunchDuration

        let morningWorkDuration = lunchTimeStart - startWork
        if morningWorkDuration >= configuration.requiredDailyHours {
            endWork = lunchTimeEnd
        }
        endWorkTimeDatePicker.date = Date(timeIntervalSinceReferenceDate: endWork)
    }

    @IBAction func endWorkValueChanged(_ sender: Any) {
        let lunchTimeEnd = lunchTimeEndDatePicker.date.timeIntervalSinceReferenceDate
        let endWork = endWorkTimeDatePicker.date.timeIntervalSinceReferenceDate
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
        let endWork = endWorkTimeDatePicker.date.timeIntervalSinceReferenceDate
        
        let workday = (endWork - lunchTimeEnd) + (lunchTimeStart - startWork)
        let overtime = workday - configuration.requiredDailyHours
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
            destination.configuration = configuration
        }
    }

    func updateDatePickers() {
        let startWork = startWorkDatePicker.date.timeIntervalSinceReferenceDate
        let lunchTimeStart = lunchTimeStartDatePicker.date.timeIntervalSinceReferenceDate
        var lunchTimeEnd = lunchTimeStart + configuration.lunchBreakDuration
        var endWork = startWork + configuration.requiredDailyHours + configuration.lunchBreakDuration

        let morningWorkDuration = lunchTimeStart - startWork
        if morningWorkDuration >= configuration.requiredDailyHours {
            lunchTimeEnd = lunchTimeStart
            endWork = lunchTimeStart
        }
        
        lunchTimeEndDatePicker.date = Date(timeIntervalSinceReferenceDate: lunchTimeEnd)
        endWorkTimeDatePicker.date = Date(timeIntervalSinceReferenceDate: endWork)
        
        updateLastValuesProperties()
    }
    
    func updateDatePickersWithConfiguration() {
        let lunchTimeEnd = configuration.lunchBreakTime + configuration.lunchBreakDuration
        let endWork = configuration.startWork + configuration.requiredDailyHours + configuration.lunchBreakDuration
        
        startWorkDatePicker.date = helper.todayDate(with: configuration.startWork)
        lunchTimeStartDatePicker.date = helper.todayDate(with: configuration.lunchBreakTime)
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
    func updateDataSource(with configurations: ConfigurationModel) {
        configuration = configurations
        updateDatePickersWithConfiguration()
    }
}
