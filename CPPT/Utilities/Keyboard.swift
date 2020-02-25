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

func keyboardRect(_ notification: Notification) -> CGRect? {
    if let rect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        return rect
    }

    return nil
}

func keyboardHeight(_ notification: Notification) -> CGFloat {
    return keyboardRect(notification)?.height ?? 0
}

func keyboardWidth(_ notification: Notification) -> CGFloat {
    return keyboardRect(notification)?.width ?? 0
}
