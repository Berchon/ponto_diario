//
//  ViewController.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 30/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    var requiredDailyHours = "08:48"
    var lunchBreakTime = "12:10"
    var lunchBreakDuration = "01:00"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfigurationViewController {
            destination.delegate = self
            destination.requiredDailyHours = requiredDailyHours
            destination.lunchBreakTime = lunchBreakTime
            destination.lunchBreakDuration = lunchBreakDuration
        }
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func updateDataSource(requiredDailyHours: String, lunchBreakTime: String, lunchBreakDuration: String) {
        self.requiredDailyHours = requiredDailyHours
        self.lunchBreakTime = lunchBreakTime
        self.lunchBreakDuration = lunchBreakDuration
    }
}
