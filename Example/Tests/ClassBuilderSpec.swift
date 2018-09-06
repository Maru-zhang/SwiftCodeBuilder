//
//  ClassBuilderSpec.swift
//  SwiftCodeBuilder_Example
//
//  Created by Maru on 2018/9/6.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import SwiftCodeBuilder

fileprivate let peopleSwiftFile: String =
"""
import Foundation
class People {
    let name: String?
    var age: Int
}

"""

fileprivate let peopleSwiftFile2: String =
"""
import Foundation
class People {
    let name: String?
    var age: Int
    class Man {
        let name: String?
        var age: Int
    }
}

"""

fileprivate let peopleSwiftFile3: String =
"""
import Foundation
class People {
    let name: String?
    var age: Int
    class Man {
        let name: String?
        var age: Int
        class Boy {
            let name: String?
            var age: Int
        }
    }
}

"""

class ClassBuilderSpec: QuickSpec {
    override func spec() {
        describe("ClassBuilderSpec") {
            it("generate plain class", closure: {
                let file = SwiftFile(name: "People.swift") { (context) in
                    context <- .import("Foundation")
                    context <- .class(ClassType(name: "People", action: { (context) in
                        context <- .property(.let, "name", .option(.string))
                        context <- .property(.var, "age", .int)
                    }))
                }
                expect(file.sourceCode.hashValue).to(equal(peopleSwiftFile.hashValue))
            })
            it("generate two order nested class", closure: {
                let file = SwiftFile(name: "People.swift") { (context) in
                    context <- .import("Foundation")
                    context <- .class(ClassType(name: "People", action: { (context) in
                        context <- .property(.let, "name", .option(.string))
                        context <- .property(.var, "age", .int)
                        context <- .class(ClassType(name: "Man", action: { (context) in
                            context <- .property(.let, "name", .option(.string))
                            context <- .property(.var, "age", .int)
                        }))
                    }))
                }
                expect(file.sourceCode.hashValue).to(equal(peopleSwiftFile2.hashValue))
            })
            it("generate three order nested class", closure: {
                let file = SwiftFile(name: "People.swift") { (context) in
                    context <- .import("Foundation")
                    context <- .class(ClassType(name: "People", action: { (context) in
                        context <- .property(.let, "name", .option(.string))
                        context <- .property(.var, "age", .int)
                        context <- .class(ClassType(name: "Man", action: { (context) in
                            context <- .property(.let, "name", .option(.string))
                            context <- .property(.var, "age", .int)
                            context <- .class(ClassType(name: "Boy", action: { (context) in
                                context <- .property(.let, "name", .option(.string))
                                context <- .property(.var, "age", .int)
                            }))
                        }))
                    }))
                }
                expect(file.sourceCode.hashValue).to(equal(peopleSwiftFile3.hashValue))
            })
        }
    }
}
