//
//  ViewController.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 30/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfigurationViewController {
            destination.requiredDailyHours = "08:48"
            destination.lunchBreakTime = "12:10"
            destination.lunchBreakDuration = "01:00"
        }
    }
}
