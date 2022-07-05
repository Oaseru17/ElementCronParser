//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

protocol Validator {
    func validateHour(hour: String) -> Int?
    func validateMinute(minute: String) -> Int?
    func validateScript(script: String) -> String?
}

class ValidatorImpl: Validator {
    
    static let shared = ValidatorImpl()
    
    func validateHour(hour: String) -> Int? {
        if let value = Int(hour), (value >= 0 && value <= 24) {
            return value
        }
        return nil
        
    }
    
    func validateMinute(minute: String) -> Int? {
        if minute.count != 2 {
            return nil
        }
        if let value = Int(minute), (value >= 0 && value <= 60) {
            return value
        }
        return nil
    }
    
    func validateScript(script: String) -> String? {
        if script.isEmpty {
            return nil
        }
        
        // Todo: Improve script validation
        return script
    }
}
