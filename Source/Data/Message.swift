//
//  Message.swift
//  Reportage
//
//  Created by Igor Matyushkin on 17.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public struct Message {
    var dateFormat: DateFormat
    var prefix: String
    var text: String
    var uppercased: Bool
    var header: MessageHeaderFooter
    var footer: MessageHeaderFooter
}
