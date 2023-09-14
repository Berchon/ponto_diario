//
//  CardView.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 10/09/23.
//

import UIKit

class CardView: UIView {
    override func layoutSubviews() {
        layer.cornerRadius = 6
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
        var shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        if let color = UIColor(named: "cardShadow") {
            shadowColor = color
        }
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.position = center
    }
}
