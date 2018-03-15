//
//  Task.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
//import ObjectMapper

/*To-Do: Make Task conforms to Mappable Protocol*/

final class Task {
    var id = 0
    var title = ""
    var status: TaskType = .toRemove
    var dueDate = ""
}

