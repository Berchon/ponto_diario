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
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.position = center
    }
}
