//
//  Logger.swift
//  Reportage
//
//  Created by Igor Matyushkin on 17.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public class Logger {
    
    // MARK: Class variables & properties
    
    public static let shared = {
        return Logger()
    }()
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init() {
        self.width = Settings.defaultWidth
        self.offset = Settings.defaultOffset
        self.offsetPattern = Settings.defaultOffsetPattern
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var width: Int
    
    @discardableResult
    public func width(_ value: Int) -> Self {
        self.width = value
        return self
    }
    
    fileprivate var offset: Int
    
    @discardableResult
    public func offset(_ value: Int) -> Self {
        self.offset = value
        return self
    }
    
    fileprivate var offsetPattern: String
    
    @discardableResult
    public func offsetPattern(_ value: String) -> Self {
        self.offsetPattern = value
        return self
    }
    
    // MARK: Public object methods
    
    @discardableResult
    public func print(_ text: String) -> Self {
        guard self.offset < self.width else {
            return self
        }
        
        var buffer = String(text)
        
        while !buffer.isEmpty {
            let substringLength = min(self.width - self.offset, buffer.count)
            let substring = String(buffer.prefix(substringLength))
            let substringWithOffset = self.line(substring, withOffset: self.offset, builtOnPattern: self.offsetPattern)
            
            let newBufferLength = buffer.count - substringLength
            buffer = String(buffer.suffix(newBufferLength))
            
            Swift.print(substringWithOffset)
        }
        
        return self
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
    
}

public extension Logger {
    
    fileprivate struct Settings {
        
        public static var defaultWidth: Int {
            get {
                return 20
            }
        }
        
        public static var defaultOffset: Int {
            get {
                return 0
            }
        }
        
        public static var defaultOffsetPattern: String {
            get {
                return " "
            }
        }
        
    }
    
}
