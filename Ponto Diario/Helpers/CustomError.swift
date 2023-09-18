//
//  CustomError.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 12/09/23.
//

import Foundation

enum CustomError: Error {
    case missingData(message: String)
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData(let message):
            return message
        }
    }
}

