//
//  StructBuilderSpec.swift
//  SwiftCodeBuilder_Tests
//
//  Created by Maru on 2018/9/6.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import SwiftCodeBuilder

fileprivate let peopleSwiftFile: String = """
import Foundation
struct People {
    let name: String?
    var age: Int
}

"""

class StructBuilderSpec: QuickSpec {

    override func spec() {
        describe("StructBuilderSpec") {
            it("generate plain struct", closure: {
                let file = SwiftFile(name: "People.swift") { (context) in
                    context <- .import("Foundation")
                    context <- .struct(StructType(name: "People", action: { (context) in
                        context <- .property(.let, "name", .option(.string))
                        context <- .property(.var, "age", .int)
                    }))
                }
                expect(file.sourceCode.hashValue).to(equal(peopleSwiftFile.hashValue))
            })
        }
    }
}
