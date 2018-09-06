//
//  Token.swift
//  Pods
//
//  Created by Maru on 2018/9/5.
//

import Foundation

public enum PointType: String {
    case `let`, `var`
}

public enum TokenType {
    /// Pointer-type, property-name, type-name
    case property(PointType, String, SwiftType)
    /// Struct-name
    case `struct`(StructType)
    /// Class-name
    case `class`(ClassType)
    /// Import-framework(I know it's hard code, but for now this is sample solution)
    case `import`(String)
    /// Comment for plain code
    case comment(String)
}
