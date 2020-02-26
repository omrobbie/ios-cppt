//
//  LoginVC.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: CustomUIButton!

    private var btnLoginCornerRadiusDefault: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLoginCornerRadiusDefault = btnLogin.layer.cornerRadius
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardStatusObserver(self, willShow: #selector(keyboardWillShow(_:)), willHide: #selector(keyboardWillHide))
    }

    override func viewDidDisappear(_ animated: Bool) {
        keyboardStatusObserverRemove(self)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        btnLogin.layer.cornerRadius = 0
    }

    @objc func keyboardWillHide() {
        btnLogin.layer.cornerRadius = btnLoginCornerRadiusDefault
    }

    func setupUI() {
        txtEmail.inputAccessoryView = btnLogin
        txtPassword.inputAccessoryView = btnLogin
    }

    @IBAction func btnLoginTapped(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text else {return}

        signIn(sender: self, email: email, password: password) {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") else {return}
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
