//
//  LocalizableButton.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 15/09/23.
//

import UIKit

class LocalizableButton: UIButton {

    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else {
                return
            }
            let title = NSLocalizedString(key, comment: "")
            UIView.performWithoutAnimation {
                setTitle(title, for: .normal)
                layoutIfNeeded()
            }
        }
    }
}
