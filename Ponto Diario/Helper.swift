//
//  Helper.swift
//  Ponto Diario
//
//  Created by Luciano Da Silva Berchon on 02/09/23.
//

import Foundation

class Helper {
    // MARK: Properties
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    let calendar = Calendar.current
    
    init() {
        dateFormatter.dateFormat = "HH:mm"
    }
    
    func todayDate(with timeInterval: TimeInterval) -> Date {
        let calendar = Calendar.current
        let midnightToday = calendar.startOfDay(for: .now)
        return midnightToday.addingTimeInterval(timeInterval)
    }
    
    func secondsSinceMidnight(date: Date) -> TimeInterval {
        let calendar = Calendar.current
        let midnightToday = calendar.startOfDay(for: .now)
        let numerOfSecondsSinceMidnight = date.timeIntervalSince(midnightToday)

        return numerOfSecondsSinceMidnight
    }
    
    func timeIntervalToHHmm(using timeInterval: TimeInterval) -> String {
        let intervalInSeconds = Int(timeInterval)
        let numberSecondsInAnHour = 3600
        let numberSecondsInAMinute = 60
        
        let hours = intervalInSeconds / numberSecondsInAnHour
        let minutes = (intervalInSeconds % numberSecondsInAnHour) / numberSecondsInAMinute
        
        let formattedTime = String(format: "%02d:%02d", hours, minutes)
        return formattedTime
    }
    
    
    
    
    func stringToDate(using timeString: String) -> Date? {
        guard let timeComponents = dateFormatter.date(from: timeString) else {
            return nil
        }
        
        let hours = calendar.component(.hour, from: timeComponents)
        let minutes = calendar.component(.minute, from: timeComponents)
        
        let updateDate = calendar.date(bySettingHour: hours, minute: minutes, second: 0, of: currentDate)
        return updateDate
    }
    
    func stringToTimeInterval(using timeString: String) -> TimeInterval? {
        guard let date = dateFormatter.date(from: timeString) else {
            return nil
        }

        let components = calendar.dateComponents([.hour, .minute], from: date)
        guard let hours = components.hour, let minutes = components.minute else {
            return nil
        }
        
        return TimeInterval(hours * 3600 + minutes * 60)
    }
    
    func timeIntervalToDate(using timeInterval: TimeInterval) -> Date? {
//        let date = Date(timeIntervalSinceNow: timeInterval)
        guard let referenceDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentDate) else {
            return nil
        }
        return Date(timeInterval: timeInterval, since: referenceDate)
    }
    
    func dateToString(using date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}