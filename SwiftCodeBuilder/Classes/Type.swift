//
//  Type.swift
//  SwiftCodeBuilder
//
//  Created by Maru on 2018/9/6.
//

import Foundation

public typealias AccessLevel = Swift.AccessLevel

public struct Swift {

    public enum AccessLevel: String {
        case `private`
        case `fileprivate`
        case `internal`
        case `public`
        case `open`
    }
}

public class DomainContext: SwiftContext {
    public var preContext: SwiftContext?
    public var tokens: [TokenType] = []
    public var name: String
    public var accessLevel: AccessLevel
    public var impProtocol: [String]
    public var extClass: [String]
    public var identifier: String
    public init(name: String,
                         identifier: String,
                         accessLevel: AccessLevel = .`internal`,
                         impProtocol: [String] = [],
                         extClass: [String] = [],
                         action: SourceCodeWriteAction) {
        self.name = name
        self.identifier = identifier
        self.accessLevel = accessLevel
        self.impProtocol = impProtocol
        self.extClass = extClass
        action(self)
    }
}

public class StructType: DomainContext {

    public init(name: String,
                         accessLevel: AccessLevel = .internal,
                         impProtocol: [String] = [],
                         extClass: [String] = [],
                         action: SourceCodeWriteAction) {
        super.init(name: name, identifier: "struct", accessLevel: accessLevel, impProtocol: impProtocol, extClass: extClass, action: action)
    }
}

public class ClassType: DomainContext {

    public init(name: String,
                accessLevel: AccessLevel = .internal,
                impProtocol: [String] = [],
                extClass: [String] = [],
                action: SourceCodeWriteAction) {
        super.init(name: name, identifier: "class", accessLevel: accessLevel, impProtocol: impProtocol, extClass: extClass, action: action)
    }
}

public class EnumType: DomainContext {

    public init(name: String,
                accessLevel: AccessLevel = .internal,
                impProtocol: [String] = [],
                extClass: [String] = [],
                action: SourceCodeWriteAction) {
        super.init(name: name, identifier: "enum", accessLevel: accessLevel, impProtocol: impProtocol, extClass: extClass, action: action)
    }
}
