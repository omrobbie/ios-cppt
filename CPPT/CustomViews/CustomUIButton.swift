//
//  CustomUIButton.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUIButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    override func prepareForInterfaceBuilder() {
        setupUI()
    }

    override func awakeFromNib() {
        setupUI()
    }

    func setupUI() {
        layer.cornerRadius = cornerRadius
    }
}
