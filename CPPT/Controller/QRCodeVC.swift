//
//  QRCodeVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class QRCodeVC: QRCodeScanner {

    var homeVC: HomeVC?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func found(code: String) {
        homeVC?.foundQRCode(code: code)
    }
}
