//
//  LocalizableNavigationItem.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 17/09/23.
//

import UIKit

class LocalizableNavigationItem: UINavigationItem {
    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else {
                return
            }
            title = NSLocalizedString(key, comment: "")
        }
    }
}
