//
//  CustomUITextView.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUITextView: UITextView, UITextViewDelegate {

    @IBInspectable
    var placeholder: String = ""

    @IBInspectable
    var placeholderColor: UIColor = .lightGray

    var isEmpty: Bool = true

    private var color: UIColor = .black

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }

    func setupUI() {
        delegate = self
        color = textColor ?? .black

        if placeholder != "" {
            isEmpty = true
            text = placeholder
            textColor = placeholderColor
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if text == placeholder {
            isEmpty = false
            text = ""
            textColor = color
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if text == "" {
            isEmpty = true
            text = placeholder
            textColor = placeholderColor
        }
    }
}
