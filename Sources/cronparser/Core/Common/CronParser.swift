//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

protocol CronParser {
    func parseString(value: String) -> [Job]
}

class CronParserImpl: CronParser {
     
    static let shared = CronParserImpl()
    
    func parseString(value: String) -> [Job] {
        var schedules = [Job]()
        for parsedItem in value.split(whereSeparator: \.isNewline) {
            let scheduleItem = String(parsedItem).trimmingLeadingAndTrailingSpaces()
            let scheduleItems = scheduleItem.split(whereSeparator: \.isWhitespace).map { String($0) }
            if let value = parseToSchedule(items: scheduleItems) {
                schedules.append(value)
            }
        }
        return schedules
    }
    
    private func parseToSchedule(items: [String]) -> Job? {
        guard items.count == 3 else {
            print("errorParseLine".localized, items.joined(separator: " "))
            return nil
        }
        guard let minute = parseMinute(items[0]) else {
            print("errorParseMinute".localized, items.joined(separator: " "))
            return nil
        }
        guard let hour = parseHour(items[1]) else {
            print("errorParseHour".localized, items.joined(separator: " "))
            return nil
        }
        guard let script = parseScript(items[2]) else {
            print("errorParseScript".localized, items.joined(separator: " "))
            return nil
        }
        return Job(minute: minute, hour: hour, script: script)
    }
    
    private func parseMinute(_ value: String) -> Int? {
        if value == "*" {
            return -1
        }
        return ValidatorImpl.shared.validateMinute(minute: value)
    }
    
    private func parseHour(_ value: String) -> Int? {
        if value == "*" {
            return -1
        }
        
        return ValidatorImpl.shared.validateHour(hour: value)
    }
    
    private func parseScript(_ value: String) -> String? {
        ValidatorImpl.shared.validateScript(script: value)
    }
}
