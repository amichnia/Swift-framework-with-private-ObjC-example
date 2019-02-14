//
//  ObjectiveCToSwift.swift
//  MyFramework
//
//  Created by Andrzej Michnia on 14/02/2019.
//  Copyright © 2019 GirAppe Studio. All rights reserved.
//

/*
 Mimic Obj-C features with Swift protocols. As long as you maintain consistency,
 it will allow you to use private Objctive-C code
 */

/// This represents Objective-C class named MyPrivateClass, defined in MyPrivateClass.h
@objc(MyPrivateClassProtocol) // Under this name this will cross Swift->ObjC boundary
internal protocol MyPrivateClass {
    var privateProperty: String { get }

    init()

    func doSomethingInternal(withSecretAttribute: Int)
}

// MARK: - Factory
@objc(Factory)
internal class Factory: NSObject {
    private static var privateClassType: MyPrivateClass.Type!

    @objc static func registerPrivateClassType(type: MyPrivateClass.Type) {
        print("REGISTRATION CALLED WITH TYPE = \(type)")
        privateClassType = type
    }

    func createMyPrivateClass() -> MyPrivateClass {
        print("FACTORY METHOD CALLED TO CREATE INSTANCE OF \(String(describing: Factory.privateClassType))")
        return Factory.privateClassType.init()
    }
}
