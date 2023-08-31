//
//  ConfigurationViewController.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 31/08/23.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    // MARK: Properties
    var requiredDailyHours = ""
    var lunchBreakTime = ""
    var lunchBreakDuration = ""

    // MARK: UI Components reference
    @IBOutlet weak var requiredDailyHoursTextField: UITextField!
    @IBOutlet weak var lunchBreakTimeTextField: UITextField!
    @IBOutlet weak var lunchBreakDurationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requiredDailyHoursTextField.text = requiredDailyHours
        lunchBreakTimeTextField.text = lunchBreakTime
        lunchBreakDurationTextField.text = lunchBreakDuration
    }
}
