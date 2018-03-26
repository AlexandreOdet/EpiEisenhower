//
//  Notifiable.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 26/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

protocol Notifiable {
    func keyboardDidShow(_ notification: Notification)
    func keyboardDidHide(_ notification: Notification)
}

extension Notifiable where Self: UIViewController {
    
    func startObservingKeyboard() {
        NotificationCenter.default.addObserver(forName: .UITextFieldTextDidBeginEditing, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardDidShow(notification)
        }
        NotificationCenter.default.addObserver(forName: .UITextFieldTextDidEndEditing, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardDidHide(notification)
        }
    }
    
    func stopObservingKeyboard() {
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidBeginEditing, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidEndEditing, object: nil)
    }
    
    func keyboardDidShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardDidHide(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                view.frame.origin.y += keyboardSize.height
            }
        }
    }
}
