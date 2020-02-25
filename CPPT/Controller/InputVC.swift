//
//  InputVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class InputVC: UIViewController {

    @IBOutlet weak var constraintBottom: NSLayoutConstraint!

    private var constraintBottomDefault: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        constraintBottomDefault = constraintBottom.constant
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkIfKeyboardShown()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillAppear(_ notification: Notification) {
        constraintBottom.constant = constraintBottomDefault + getKeyboardHeight(notification)
    }

    @objc func keyboardWillDisappear() {
        constraintBottom.constant = constraintBottomDefault
    }

    func checkIfKeyboardShown() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
