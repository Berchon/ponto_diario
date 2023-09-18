//
//  HelperStringsEnum.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 18/09/23.
//

import Foundation

enum HelperStringsEnum: String {
    case Error_saving_settings
    case Settings_not_found
    case Could_not_retrieve_saved_settings
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
}
