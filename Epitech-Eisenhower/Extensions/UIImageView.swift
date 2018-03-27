//
//  UIImageView.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 19/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func round(withBorder: Bool = true, borderColor: UIColor = UIColor.white, borderSize: CGFloat = 1.0) {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
        if withBorder == true {
            layer.borderWidth = borderSize
            layer.borderColor = borderColor.cgColor
        }
    }
}
