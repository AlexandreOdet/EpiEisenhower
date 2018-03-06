//
//  EisenhowerTaskStatus.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

enum TaskStatus {
    case toDo
    case toDelegate
    case toPlan
    case toRemove
    
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
