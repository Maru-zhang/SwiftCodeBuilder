//
//  SwiftFile.swift
//  SwiftCodeBuilder
//
//  Created by Maru on 2018/9/4.
//

import Foundation

public protocol SwiftContext: class {
    var tokens: [TokenType] { set get }
    var preContext: SwiftContext? { get set }
}

extension SwiftContext {

    var contextIndex: Int {
        var index = 0
        var context = preContext
        while context != nil {
            index += 1
            context = context?.preContext
        }
        return index
    }
}

public typealias SourceCodeWriteAction = (SwiftContext) -> ()

public class SwiftFile {

    public let context: FileType

    public var sourceCode: String {
        return <<<context
    }

    public init(name: String, action: @escaping SourceCodeWriteAction) {
        self.context = FileType(name: name, action: action)
    }
}

public class FileType: SwiftContext {
    public var preContext: SwiftContext?
    public var tokens: [TokenType] = []
    public var name: String
    public required init(name: String, action: SourceCodeWriteAction) {
        self.name = name
        action(self)
    }
}
