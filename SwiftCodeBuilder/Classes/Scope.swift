//
//  Scope.swift
//  SwiftCodeBuilder
//
//  Created by Maru on 2018/9/4.
//

import Foundation

indirect enum Scope {
    case file
    case claess
    case nested(Scope)
}

public indirect enum SwiftType {
    case string
    case int
    case int8
    case int16
    case int32
    case int64
    case array(SwiftType)
    case any
    case bool
    case option(SwiftType)
    case define(String)
}

extension SwiftType {

    var text: String {
        switch self {
        case .string:
            return "String"
        case .int:
            return "Int"
        case .int8:
            return "Int8"
        case .int16:
            return "Int16"
        case .int32:
            return "Int32"
        case .int64:
            return "Int64"
        case .array(let type):
            return "[\(type.text)]"
        case .any:
            return "Any"
        case .bool:
            return "Bool"
        case .option(let type):
            return "\(type.text)?"
        case .define(let type):
            return type
        }
    }
}
