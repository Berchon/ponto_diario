//
//  CustomDatePicker.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 08/09/23.
//

import UIKit

class CustomDatePicker: UIDatePicker {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        let blueColor = UIColor(named: "navigationBackground")
        if let color = UIColor(named: "navigationBackground") {
            let firstView = subviews[0]
            firstView.tintColor = color // muda somente o label da data e da hora
            
            tintColor = color //muda a cor do texto selecionado, no calendario: muda a cor do dia selecionado e das setas de navegacao
        }
        
        // Deixarei esse código abaixo comentado somente para ficar de referência
        //
        // backgroundColor = .white // muda o background de toda a view do datePicker
        // layer.borderWidth = 2
        // layer.borderColor = UIColor.green.cgColor
    }
}
