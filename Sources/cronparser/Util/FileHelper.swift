//
//  File.swift
//  
//
//  Created by Precious Osaro on 05/07/2022.
//

import Foundation

class FileHelper {
    static func doesFileExist(filePath: String) -> Bool {
        if (FileManager.default.fileExists(atPath: filePath)) {
            return true
        } else {
            return false;
        }
    }
    
    static func readFile(filePath: String) throws -> String? {
        try String(contentsOfFile: filePath, encoding: .utf8)
    }
    
    static func getCurrentPath() -> String {
        let fileManager = FileManager.default
        return fileManager.currentDirectoryPath
    }
}
