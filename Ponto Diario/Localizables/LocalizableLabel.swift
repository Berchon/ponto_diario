//
//  LocalisableLabel.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 15/09/23.
//

import UIKit

class LocalizableLabel: UILabel {

    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else {
                return
            }
            text = NSLocalizedString(key, comment: "")
        }
    }
}
