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
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requiredDailyHoursDatePicker.contentHorizontalAlignment = .left
        startWorkDatePicker.contentHorizontalAlignment = .left
        lunchBreakTimeDatePicker.contentHorizontalAlignment = .left
        lunchBreakDurationDatePicker.contentHorizontalAlignment = .left
        updateDatePickers()
        updateSegmentedControlSelection()
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
            
            let toastView = ToastView.loadFromNib(style: .success)
            toastView.setMessage("Dados atualizados com sucesso")
            toastView.show()
        case .failure(let error):
            let toastView = ToastView.loadFromNib(style: .failed)
            toastView.setMessage(error.localizedDescription)
            toastView.show()
        }
    }
    
    @IBAction func changeTheme(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            setTheme(for: .light)
        case 1:
            setTheme(for: .dark)
        default:
            setTheme(for: .system)
        }
    }
    
    func updateDatePickers() {
        requiredDailyHoursDatePicker.date = helper.todayDate(with: configuration.requiredDailyHours)
        startWorkDatePicker.date = helper.todayDate(with: configuration.startWork)
        lunchBreakTimeDatePicker.date = helper.todayDate(with: configuration.lunchBreakTime)
        lunchBreakDurationDatePicker.date = helper.todayDate(with: configuration.lunchBreakDuration)
    }
    
    func setTheme(for theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
        UserDefaults.standard.setValue(theme.rawValue, forKey: "theme")
        switch theme {
        case .light:
            overrideUserInterfaceStyle = .light
        case .dark:
            overrideUserInterfaceStyle = .dark
        case .system:
            overrideUserInterfaceStyle = .unspecified
        }
    }
    
    func updateSegmentedControlSelection() {
        let currentTheme = getCurrentTheme()
        
        switch currentTheme {
        case .light:
            themeSegmentedControl.selectedSegmentIndex = 0
        case .dark:
            themeSegmentedControl.selectedSegmentIndex = 1
        case .system:
            themeSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }
}
