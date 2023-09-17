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
    
    func saveData(with configuration: ConfigurationModel) -> Result<Void, CustomError> {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(configuration)
            UserDefaults.standard.set(data, forKey: "configuration")
            return .success(())
        } catch {
            let message = NSLocalizedString("Erro ao salvar as configurações.", comment: "Localizable")
            return .failure(.missingData(message: message))
        }
    }
    
    func loadData() -> Result<ConfigurationModel, CustomError> {
        guard let data = UserDefaults.standard.data(forKey: "configuration") else {
            let message = NSLocalizedString("Configurações não encontradas.", comment: "Localizable")
            return .failure(.missingData(message: message))
        }
        let decoder = JSONDecoder()
        do {
            let configuration = try decoder.decode(ConfigurationModel.self, from: data)
            return .success(configuration)
        } catch {
            let message = NSLocalizedString("Não foi possível recuperar as configurações salvas.", comment: "Localizable")
            return .failure(.missingData(message: message))
        }
    }
    
    func todayDate(with timeInterval: TimeInterval) -> Date {
        let midnightToday = calendar.startOfDay(for: .now)
        return midnightToday.addingTimeInterval(timeInterval)
    }
    
    func secondsSinceMidnight(date: Date) -> TimeInterval {
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
    
    //
    // I'm not using the functions below, but I decided to leave them
    
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
        let numberSecondsInAnHour = 3600
        let numberSecondsInAMinute = 60
        return TimeInterval(hours * numberSecondsInAnHour + minutes * numberSecondsInAMinute)
    }
    
    func timeIntervalToDate(using timeInterval: TimeInterval) -> Date? {
        guard let referenceDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentDate) else {
            return nil
        }
        return Date(timeInterval: timeInterval, since: referenceDate)
    }
    
    func dateToString(using date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
