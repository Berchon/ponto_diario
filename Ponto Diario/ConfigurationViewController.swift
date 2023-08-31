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
    
    weak var delegate: HomeViewControllerDelegate?

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
    
    @IBAction func saveData(_ sender: Any) {
        guard let homeViewController = delegate else {
            print("Erro ao atualizar a fonte de dados")
            return
        }
        
        guard let requiredDailyHours = requiredDailyHoursTextField.text else {
            print("Erro ao obter a carga horária diária")
            return
        }
        guard let lunchBreakTime = lunchBreakTimeTextField.text else {
            print("Erro ao obter a previsão de saída para o almoço")
            return
        }
        guard let lunchBreakDuration = lunchBreakDurationTextField.text else {
            print("Erro ao obter otempo de intervalo para o almoço")
            return
        }
        
        homeViewController.updateDataSource(requiredDailyHours: requiredDailyHours, lunchBreakTime: lunchBreakTime, lunchBreakDuration: lunchBreakDuration)
        
        print("Dados atualizados com sucesso")
    }
}
