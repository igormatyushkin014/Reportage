//
//  DateFormat.swift
//  Reportage
//
//  Created by Igor Matyushkin on 17.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum DateFormat {
    case date
    case time
    case dateTime
    case custom(format: String)
    case none
}
