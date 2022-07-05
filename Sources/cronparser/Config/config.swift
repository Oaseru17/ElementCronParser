//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

struct Config {
    static let defaultConfigLocation = "config.txt"
    
    static func getDefaultConfig() throws -> String? {
        if let url = Bundle.module.url(forResource: "config", withExtension: "txt"){
            return try String(contentsOf: url, encoding: .utf8)
        } else {
            return nil
        }
    }
}
