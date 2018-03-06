//
//  UIColorExtension.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public var epiBackgroundColor: UIColor {
        return UIColor(red: 128/255, green: 202/255, blue: 220/255, alpha: 1)
    }
    
    public var epiOrange: UIColor {
        return UIColor(red: 1, green: 185/255, blue: 55/255, alpha: 0.9)
    }
    
    public var epiYellow: UIColor {
        return UIColor(red: 248/255, green: 232/255, blue: 28/255, alpha: 0.8)
    }
    
    public var taskRed: UIColor {
        return UIColor(red: 1, green: 58/255, blue: 7/255, alpha: 0.8)
    }
    
    public var taskLightGreen: UIColor {
        return UIColor(red: 248/255, green: 232/255, blue: 28/255, alpha: 0.4)
    }
    
    public var taskGreen: UIColor {
        return UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 0.8)
    }
    
    public var taskBlue: UIColor {
        return UIColor(red: 13/255, green: 160/255, blue: 178/255, alpha: 0.8)
    }
}
