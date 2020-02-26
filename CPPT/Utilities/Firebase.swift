//
//  Firebase.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation
import Firebase

func signIn(sender: UIViewController, email: String, password: String, completion: @escaping () -> ()) {
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
            alertMessage(sender: sender, type: .error, message: error.localizedDescription, completion: nil)
            return
        }
        completion()
    }
}
