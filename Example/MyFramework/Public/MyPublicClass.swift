//
//  MyPublicClass.swift
//  MyFramework
//
//  Created by Andrzej Michnia on 14/02/2019.
//  Copyright © 2019 GirAppe Studio. All rights reserved.
//

import Foundation

public class MyPublicClass {
    private let privateClass: MyPrivateClass

    public init() {
        privateClass = Factory().createMyPrivateClass()
    }

    public func doSomething() {
        privateClass.doSomethingInternal(withSecretAttribute: 314)
    }
}
