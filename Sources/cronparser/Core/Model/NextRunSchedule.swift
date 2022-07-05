//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

struct NextRunSchedule: CustomStringConvertible {
    let hour: Int
    let minute: Int
    let today: Bool
    let script: String
    
    var description: String {
        let hourOutput = hour <= 0 ? 0 : hour
        let minuteOutput = minute <= 0 ? 0 : minute
        return ("\(String(format: "%02d", hourOutput)):\(String(format: "%02d", minuteOutput)) \(today ? "today" : "tomorrow") - \(script)")
    }
}
