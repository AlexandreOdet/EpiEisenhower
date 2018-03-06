//
//  EisenhowerTaskStatus.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

enum TaskType: String {
    case toDo = "to_do"
    case toDelegate = "to_delegate"
    case toPlan = "to_plan"
    case toRemove = "to_remove"
    
    init(isImportant: Bool, isUrgent: Bool) {
        switch (isImportant, isUrgent) {
        case (true, true): //isImportant and isUrgent
            self = .toDo
        case (true, false): //isImportant and is not urgent
            self = .toPlan
        case (false, true): //is not important and is urgent
            self = .toDelegate
        default:
            self = .toRemove
        }
    }
}
