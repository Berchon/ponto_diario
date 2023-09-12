//
//  configurationModel.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 12/09/23.
//

import Foundation

internal struct ConfigurationModel: Codable {
    internal var requiredDailyHours: TimeInterval
    internal var startWork: TimeInterval
    internal var lunchBreakTime: TimeInterval
    internal var lunchBreakDuration: TimeInterval
}
