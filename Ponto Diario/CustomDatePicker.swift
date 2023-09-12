//
//  CustomDatePicker.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 08/09/23.
//
// This file was created solely for testing the styling os the
// `UIDatePicker`. I've chosen not be deleted itr, so it can serve
// as a reference in the future
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
        let blueColor = UIColor(red: 70/255, green: 156/255, blue: 221/255, alpha: 1)
        date = .now.addingTimeInterval(3600*24)
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = blueColor.cgColor
        tintColor = blueColor //muda a cor do texto selecionado, no calendario: muda a cor do dia selecionado e das setas de navegacao
//        textColor = .green
//        setValue(UIColor.yellow, forKey: "textColor")
//        setValue(UIColor.brown, forKey: "backgroundColor")
//        overrideUserInterfaceStyle = .dark // muda o texto para preto/branco
        setNeedsLayout()
        layoutIfNeeded()
        
        print("========")
        print(self)
        
        print("========")
        print(subviews.count)
        for subview in subviews {
            print(subview)
        }
        let firstView = subviews[0]
        
        print("=====")
        print(firstView.subviews.count)
        for subview in firstView.subviews {
            print(subview)
            print()
        }
        
//        firstView.backgroundColor = .green // o mesmo que backgroud
//        firstView.tintColor = .magenta // muda somente o label da data e da hora
        
        let dateLabel = firstView.subviews[0]
        let timeLabel = firstView.subviews[1]
        
        print("=====")
        print(dateLabel)
//        dateLabel.backgroundColor = .white
//        dateLabel.tintColor = .white

        print()
        print(timeLabel)
//        timeLabel.tintColor = .red
        timeLabel.backgroundColor = .white
//
//        print("=====")
//        let label = view.subviews[1]
//        label.setv
//        print(label.text)
//        let memoryAddress = label._
//        let address: UnsafeMutableRawPointer = UnsafeMutableRawPointer(bitPattern: <#T##UInt#>)
        
//        print(view.subviews.count)
//        for subview in view.subviews {
//            print(subview)
//            for label in subview {
//                print(label)
//            }
//        }
//        view.subviews[1].setValue(UIColor.yellow, forKey: "backgroundColor")
//        setValue(UIColor.yellow, forKey: <#T##String#>)
        
//        findLabels()
    }
    
    private var dateLabel: UILabel?
    private var timeLabel: UILabel?
    
    var textColor = UIColor.magenta
    
    func findLabels() {
        guard let lbl = subviews[0].subviews[0] as? UILabel else {
            return
        }
        dateLabel = lbl
        timeLabel = lbl
    }

}
