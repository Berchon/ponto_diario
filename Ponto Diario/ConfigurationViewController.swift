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

    var configuration: ConfigurationModel = ConfigurationModel(
        requiredDailyHours: TimeInterval(),
        startWork: TimeInterval(),
        lunchBreakTime: TimeInterval(),
        lunchBreakDuration: TimeInterval()
    )
    
    weak var delegate: HomeViewControllerDelegate?

    // MARK: UI Components reference
    @IBOutlet weak var requiredDailyHoursDatePicker: UIDatePicker!
    @IBOutlet weak var startWorkDatePicker: UIDatePicker!
    @IBOutlet weak var lunchBreakTimeDatePicker: UIDatePicker!
    @IBOutlet weak var lunchBreakDurationDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requiredDailyHoursDatePicker.contentHorizontalAlignment = .left
        startWorkDatePicker.contentHorizontalAlignment = .left
        lunchBreakTimeDatePicker.contentHorizontalAlignment = .left
        lunchBreakDurationDatePicker.contentHorizontalAlignment = .left
        updateDatePickers()
    }
    
    func updateDatePickers() {
        requiredDailyHoursDatePicker.date = helper.todayDate(with: configuration.requiredDailyHours)
        startWorkDatePicker.date = helper.todayDate(with: configuration.startWork)
        lunchBreakTimeDatePicker.date = helper.todayDate(with: configuration.lunchBreakTime)
        lunchBreakDurationDatePicker.date = helper.todayDate(with: configuration.lunchBreakDuration)
    }
    
    @IBAction func saveData(_ sender: Any) {
        configuration.requiredDailyHours = helper.secondsSinceMidnight(date: requiredDailyHoursDatePicker.date)
        configuration.startWork = helper.secondsSinceMidnight(date: startWorkDatePicker.date)
        configuration.lunchBreakTime = helper.secondsSinceMidnight(date: lunchBreakTimeDatePicker.date)
        configuration.lunchBreakDuration = helper.secondsSinceMidnight(date: lunchBreakDurationDatePicker.date)

        let saveResult = helper.saveData(with: configuration)
        switch saveResult {
        case .success:
            delegate?.updateDataSource(with: configuration)
            
            print("Dados atualizados com sucesso")
        case .failure(let error):
            print(error.localizedDescription)
            print(error.errorDescription ?? "")
        }
        
        
    }
}
