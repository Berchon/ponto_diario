//
//  HomeViewControllerStringsEnum.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 18/09/23.
//

import Foundation

enum HomeViewControllerStringsEnum: String {
    case Must_be_earlier_than_lunch_break_start_time
    case Must_be_later_than_entry_time
    case Must_be_later_than_lunch_break_start_time
    case Must_be_later_than_lunch_break_end_time
    case Using_the_default
    case Overtime
    case Unworked_hours
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
}
