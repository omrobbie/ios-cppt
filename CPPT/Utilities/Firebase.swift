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

func signOut(sender: UIViewController, completion: @escaping () -> ()) {
    do {
        try Auth.auth().signOut()
        completion()
    } catch {
        alertMessage(sender: sender, type: .error, message: error.localizedDescription, completion: nil)
    }
}

func isUserNotSignIn(completion: @escaping () -> ()) {
    if Auth.auth().currentUser == nil {
        completion()
    }
}

func isUserSignIn(completion: @escaping (_ uid: String) -> ()) {
    if let currentUser = Auth.auth().currentUser {
        completion(currentUser.uid)
    }
}
