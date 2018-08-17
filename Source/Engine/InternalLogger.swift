//
//  InternalLogger.swift
//  Reportage
//
//  Created by Igor Matyushkin on 17.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

internal class InternalLogger {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    init() {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    public func print(_ message: Message, withOffset offset: Int, builtOnPattern offsetPattern: String, andLineWidth lineWidth: Int) {
        guard offset < lineWidth else {
            return
        }
        
        let formattedDate = self.currentDate(formattedWith: message.dateFormat)
        var textToPrint = formattedDate
            + (formattedDate.count > 0 ? " " : "")
            + message.prefix
            + (message.prefix.count > 0 ? " " : "")
            + message.text
        
        if message.uppercased {
            textToPrint = textToPrint.uppercased()
        }
        
        var buffer = String(textToPrint)
        
        while !buffer.isEmpty {
            let substringLength = min(lineWidth - offset, buffer.count)
            let substring = String(buffer.prefix(substringLength))
            let substringWithOffset = self.line(substring, withOffset: offset, builtOnPattern: offsetPattern)
            
            let newBufferLength = buffer.count - substringLength
            buffer = String(buffer.suffix(newBufferLength))
            
            Swift.print(substringWithOffset)
        }
        
        Swift.print()
    }
    
    // MARK: Private object methods
    
    fileprivate func string(withPattern pattern: String, repeated times: Int) -> String {
        var result = ""
        
        for _ in 0..<times {
            result += pattern
        }
        
        return result
    }
    
    fileprivate func line(_ text: String, withOffset offset: Int, builtOnPattern offsetPattern: String) -> String {
        return self.string(withPattern: offsetPattern, repeated: offset) + text
    }
    
    fileprivate func currentDate(formattedWith dateFormat: DateFormat) -> String {
        switch dateFormat {
        case .date:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, YYYY"
            return dateFormatter.string(from: Date())
        case .time:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: Date())
        case .dateTime:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, YYYY HH:mm:ss"
            return dateFormatter.string(from: Date())
        case .custom(let format):
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: Date())
        case .none:
            return ""
        }
    }
    
}
