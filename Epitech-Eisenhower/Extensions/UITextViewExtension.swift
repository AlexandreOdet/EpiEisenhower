//
//  UITextViewExtension.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 16/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func centerTextVertically() {
        let deadSpace = bounds.size.height - contentSize.height
        let inset = max(0, deadSpace/2.0)
        contentInset = UIEdgeInsetsMake(inset, contentInset.left, inset, contentInset.right)
    }
}
