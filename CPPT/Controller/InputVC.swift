//
//  InputVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import SignaturePad

class InputVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    @IBOutlet weak var signaturePad: SignaturePad!
    @IBOutlet weak var btnSignatureStart: CustomUIButton!

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

    @IBAction func btnSignatureStartTapped(_ sender: Any) {
        let toggle = scrollView.isScrollEnabled
        scrollView.isScrollEnabled = !toggle

        if toggle {
            btnSignatureStart.backgroundColor = #colorLiteral(red: 0.1806240082, green: 0.2743958831, blue: 0.4199774861, alpha: 1)
        } else {
            btnSignatureStart.backgroundColor = #colorLiteral(red: 0.3236097395, green: 0.4890208244, blue: 0.7480755448, alpha: 1)
        }
    }

    @IBAction func btnSignatureClearTapped(_ sender: Any) {
        signaturePad.clear()
    }
}
