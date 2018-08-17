//
//  MessageHeaderFooter.swift
//  Reportage
//
//  Created by Igor Matyushkin on 17.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum MessageHeaderFooter {
    case emptyLine
    case line(pattern: String)
    case custom(text: String)
    case none
}
