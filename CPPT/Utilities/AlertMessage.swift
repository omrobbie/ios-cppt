//
//  AlertMessage.swift
//  CPPT
//
//  Created by omrobbie on 26/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

enum alertType: String {
    case error = "Terjadi Kesalahan!"
    case info = "Informasi"
    case question = "Konfirmasi"
}

func alertMessage(sender: UIViewController, type: alertType, message: String, completion: (() -> ())?) {
    let alert = UIAlertController(title: type.rawValue, message: message, preferredStyle: .alert)
    let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
    let actionCancel = UIAlertAction(title: "Batal", style: .cancel, handler: nil)
    let actionYes = UIAlertAction(title: "Ya", style: .default) { (_) in
        if let completion = completion {
            completion()
        }
    }

    switch type {
    case .question:
        alert.addAction(actionYes)
        alert.addAction(actionCancel)
    default:
        alert.addAction(actionOk)
    }

    sender.present(alert, animated: true, completion: nil)
}
