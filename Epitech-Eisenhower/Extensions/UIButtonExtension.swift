//
//  UIButtonExtension.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 12/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func roundCorner() {
        layer.cornerRadius = 6
        clipsToBounds = true
    }
}
