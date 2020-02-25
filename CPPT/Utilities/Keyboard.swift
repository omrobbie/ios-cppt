//
//  Keyboard.swift
//  CPPT
//
//  Created by omrobbie on 25/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

func keyboardStatusObserver(_ observer: Any, willShow: Selector, willHide: Selector) {
    NotificationCenter.default.addObserver(observer, selector: willShow, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(observer, selector: willHide, name: UIResponder.keyboardWillHideNotification, object: nil)
}

func keyboardStatusObserverRemove(_ observer: Any) {
    NotificationCenter.default.removeObserver(observer)
}

func getKeyboardHeight(_ notification: Notification) -> CGFloat {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        return keyboardSize.height
    }

    return 0
}

func getKeyboardWidth(_ notification: Notification) -> CGFloat {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        return keyboardSize.width
    }

    return 0
}
