//
//  Task.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import ObjectMapper

/*To-Do: Make Task conforms to Mappable Protocol*/

final class TaskContent: Mappable, TaskPreviewCellProtocol {
    var id = 0
    var title = ""
    var description = ""
    var dueDate = ""
    
    var team = [UserContent]()
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        dueDate <- map["type"]
        team <- map["team"]
    }
}
