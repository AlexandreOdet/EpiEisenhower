//
//  TaskPreviewCollectionViewCell.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 14/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

final class TaskPreviewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var taskDetailLabel: UILabel?
    @IBOutlet weak private var dueDateLabel: UILabel?
    
    func buildCell(withTask task: Task) {
        taskDetailLabel?.text = task.title
        dueDateLabel?.text = Date().toString()
    }
}
