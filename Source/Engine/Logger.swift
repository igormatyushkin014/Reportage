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
        self.dateFormat = Settings.defaultDateFormat
        self.prefix = Settings.defaultPrefix
        self.uppercased = Settings.uppercasedByDefault
        self.header = Settings.defaultHeader
        self.footer = Settings.defaultFooter
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
    
    fileprivate var dateFormat: DateFormat
    
    @discardableResult
    public func dateFormat(_ value: DateFormat) -> Self {
        self.dateFormat = value
        return self
    }
    
    fileprivate var prefix: String
    
    @discardableResult
    public func prefix(_ value: String) -> Self {
        self.prefix = value
        return self
    }
    
    fileprivate var uppercased: Bool
    
    @discardableResult
    public func uppercased(_ value: Bool) -> Self {
        self.uppercased = value
        return self
    }
    
    fileprivate var header: MessageHeaderFooter
    
    @discardableResult
    public func header(_ value: MessageHeaderFooter) -> Self {
        self.header = value
        return self
    }
    
    fileprivate var footer: MessageHeaderFooter
    
    @discardableResult
    public func footer(_ value: MessageHeaderFooter) -> Self {
        self.footer = value
        return self
    }
    
    // MARK: Public object methods
    
    @discardableResult
    public func print(_ message: String) -> Self {
        let internalMessage = Message(dateFormat: self.dateFormat, prefix: self.prefix, text: message, uppercased: self.uppercased, header: self.header, footer: self.footer)
        InternalLogger().print(internalMessage, withOffset: self.offset, builtOnPattern: self.offsetPattern, andLineWidth: self.width)
        return self
    }
    
    @discardableResult
    public func print(_ messages: String...) -> Self {
        let text = messages.joined(separator: " ")
        let internalMessage = Message(dateFormat: self.dateFormat, prefix: self.prefix, text: text, uppercased: self.uppercased, header: self.header, footer: self.footer)
        InternalLogger().print(internalMessage, withOffset: self.offset, builtOnPattern: self.offsetPattern, andLineWidth: self.width)
        return self
    }
    
    // MARK: Private object methods
    
}

public extension Logger {
    
    fileprivate struct Settings {
        
        public static var defaultWidth: Int {
            get {
                return 40
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
        
        public static var defaultDateFormat: DateFormat {
            get {
                return .dateTime
            }
        }
        
        public static var defaultPrefix: String {
            get {
                return ""
            }
        }
        
        public static var uppercasedByDefault: Bool {
            get {
                return false
            }
        }
        
        public static var defaultHeader: MessageHeaderFooter {
            get {
                return .none
            }
        }
        
        public static var defaultFooter: MessageHeaderFooter {
            get {
                return .emptyLine
            }
        }
        
    }
    
}
