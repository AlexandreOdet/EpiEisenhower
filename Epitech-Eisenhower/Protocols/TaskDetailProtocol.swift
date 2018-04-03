//
//  TaskDetailProtocol.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 03/04/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

protocol TaskDetailProtocol: TaskPreviewCellProtocol {
    var dueDate: String { get }
}
