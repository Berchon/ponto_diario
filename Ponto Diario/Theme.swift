//
//  Theme.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 13/09/23.
//

import Foundation
import UIKit

enum Theme: String {
    case light, dark, system

    var uiInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .unspecified
        }
    }
}
