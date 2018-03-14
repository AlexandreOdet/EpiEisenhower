//
//  AddTaskCollectionViewCell.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 14/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class AddTaskCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addImageView: UIImageView? = UIImageView(image: R.image.addTask())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
