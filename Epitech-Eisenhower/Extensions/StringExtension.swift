//
//  StringExtension.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

extension String {
    public var isValidEmail: Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", Constants.formatting.swiftEmailRegex)
        return emailTest.evaluate(with: self)
    }
}
