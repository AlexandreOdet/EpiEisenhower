//
//  ProfilePicutre.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 28/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

enum ProfilePicture {
    case robot
    case monkey
    case ghost
    
    case `default`
    
    var associatedImage: UIImage? {
        switch self {
        case .monkey:
            return R.image.monkey()
        case .robot:
            return R.image.searching()
        case .ghost:
            return R.image.pacman()
        default:
            return R.image.profilePlaceholder()
        }
    }
}
