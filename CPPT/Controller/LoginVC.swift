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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        txtEmail.inputAccessoryView = btnLogin
        txtPassword.inputAccessoryView = btnLogin
    }

    @IBAction func btnLoginTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NavigationController") else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
