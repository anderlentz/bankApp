//
//  CustonNavigationController.swift
//  BankApp
//
//  Created by Anderson Lentz on 02/08/19.
//  Copyright © 2019 Anderson Lentz. All rights reserved.
//

import UIKit

class CustonNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.setValue(true, forKey: "hidesShadow")
    }
}
