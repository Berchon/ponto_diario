//
//  ConfigurationViewControllerStringsEnum.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 18/09/23.
//

import Foundation

enum ConfigurationViewControllerStringsEnum: String {
    case Data_updated_successfully
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
}
