//
//  ViewController.swift
//  SwiftCodeBuilder
//
//  Created by Maru-zhang on 09/04/2018.
//  Copyright (c) 2018 Maru-zhang. All rights reserved.
//

import UIKit
import SwiftCodeBuilder

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        print(file.sourceCode)
    }
}

