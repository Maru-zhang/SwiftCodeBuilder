//
//  Operator.swift
//  SwiftCodeBuilder
//
//  Created by Maru on 2018/9/6.
//

import Foundation

infix operator <-
infix operator <*>
prefix operator <<<

public func <-(context: SwiftContext, token: TokenType) {
    switch token {
        case .class(let entity):
            entity.preContext = context
        case .struct(let entity):
            entity.preContext = context
        default: break
    }
    context.tokens.append(token)
}

prefix func <<<(context: SwiftContext) -> String {
    var sourceCode = ""
    guard !context.tokens.isEmpty else {
        return ""
    }
    for token in context.tokens {
        sourceCode<*>context.contextIndex
        sourceCode += <<<token
        sourceCode += "\n"
    }
    return sourceCode
}

prefix func <<<(context: DomainContext) -> String {
    var sourceCode = ""
    if context.accessLevel != .internal {
        sourceCode += (context.accessLevel.rawValue + " ")
    }
    let contextIndex = context.contextIndex
    sourceCode += context.identifier
    sourceCode += " "
    sourceCode += context.name
    if (!context.impProtocol.isEmpty || !context.extClass.isEmpty) {
        sourceCode += ":"
        for `class` in context.extClass {
            sourceCode += " "
            sourceCode += `class`
        }
        for `protocol` in context.impProtocol {
            sourceCode += " "
            sourceCode += `protocol`
        }
    }
    sourceCode += " {"
    for token in context.tokens {
        sourceCode += "\n"
        sourceCode<*>(contextIndex+1)
        sourceCode += <<<token
    }
    sourceCode += "\n"
    sourceCode<*>(contextIndex)
    sourceCode += "}"
    return sourceCode
}

prefix func <<<(token: TokenType) -> String {
    switch token {
    case .property(let point, let name, let typeName):
        return "\(point.rawValue) \(name): \(typeName.text)"
    case .struct(let structEntity):
        return <<<structEntity
    case .class(let classEntity):
        return <<<classEntity
    case .`import`(let framework):
        return "import \(framework)"
    case .comment(let content):
        return "/// \(content)"
    }
}

/// convice add white space
func <*>(left: inout String, count: Int) {
    guard count > 0 else { return }
    left += String(repeating: " ", count: (count - 1) * 4)
}
