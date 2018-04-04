//
//  TaskList.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 14/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import ObjectMapper

final class TaskList: Mappable {
    var tasks = [TaskContent]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
            tasks <- map["tasks"]
    }
}

//To-Do make TaskList conforms to Mappable Protocol
