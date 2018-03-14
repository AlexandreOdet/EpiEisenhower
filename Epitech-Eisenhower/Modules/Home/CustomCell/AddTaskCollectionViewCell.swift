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
    var addImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //commonInitializer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //commonInitializer()
    }
    
    private func commonInitializer() {
        addImageView = UIImageView(frame: contentView.frame)
        addImageView.image = R.image.addTask()
        addImageView.contentMode = .scaleAspectFit
        contentView.addSubview(addImageView)
    }
}
