//
//  ConfigurationViewController.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 31/08/23.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    // MARK: Properties
    let helper = Helper()
    
    var requiredDailyHours: TimeInterval = TimeInterval()
    var startWork: TimeInterval = TimeInterval()
    var lunchBreakTime: TimeInterval = TimeInterval()
    var lunchBreakDuration: TimeInterval = TimeInterval()
    
    weak var delegate: HomeViewControllerDelegate?

    // MARK: UI Components reference
    @IBOutlet weak var requiredDailyHoursDatePicker: UIDatePicker!
    @IBOutlet weak var startWordDatePicker: UIDatePicker!
    @IBOutlet weak var lunchBreakTimeDatePicker: UIDatePicker!
    @IBOutlet weak var lunchBreakDurationDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requiredDailyHoursDatePicker.contentHorizontalAlignment = .left
        startWordDatePicker.contentHorizontalAlignment = .left
        lunchBreakTimeDatePicker.contentHorizontalAlignment = .left
        lunchBreakDurationDatePicker.contentHorizontalAlignment = .left
        updateDatePickers()
    }
    
    func updateDatePickers() {
        requiredDailyHoursDatePicker.date = helper.todayDate(with: requiredDailyHours)
        startWordDatePicker.date = helper.todayDate(with: startWork)
        lunchBreakTimeDatePicker.date = helper.todayDate(with: lunchBreakTime)
        lunchBreakDurationDatePicker.date = helper.todayDate(with: lunchBreakDuration)
    }
    
    @IBAction func saveData(_ sender: Any) {
        let dailyHours = helper.secondsSinceMidnight(date: requiredDailyHoursDatePicker.date)
        let startWork = helper.secondsSinceMidnight(date: startWordDatePicker.date)
        let lunchTime = helper.secondsSinceMidnight(date: lunchBreakTimeDatePicker.date)
        let lunchDuration = helper.secondsSinceMidnight(date: lunchBreakDurationDatePicker.date)

        delegate?.updateDataSource(requiredDailyHours: dailyHours, startWork: startWork, lunchBreakTime: lunchTime, lunchBreakDuration: lunchDuration)
        print("Dados atualizados com sucesso")
    }
}
