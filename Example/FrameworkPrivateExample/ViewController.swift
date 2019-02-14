//
//  ViewController.swift
//  FrameworkPrivateExample
//
//  Created by Andrzej Michnia on 12/02/2019.
//  Copyright © 2019 GirAppe Studio. All rights reserved.
//

import UIKit
import MyFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         // Should print info to console, showing that objc member was triggered, created and used
        let publicClass = MyPublicClass()
        publicClass.doSomething()

        // TODO: Uncomment this to see that private class is not accessible
//        let privateClass = MyPrivateClass()
//        privateClass.doSomethingInternal(withSecretAttribute: 314)
    }
}

