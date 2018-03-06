//
//  TaskState.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

enum State: String {
    case done = "done"
    case undone = "undone"
    
    init(state: String) {
        switch state {
        case "done":
            self = .done
        default:
            self = .undone
        }
    }
}
