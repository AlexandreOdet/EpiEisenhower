//
//  Task.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 04/04/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import ObjectMapper

class Task: Mappable {
    var content = TaskContent()
    
    required init?(map: Map) {
    }
    
    init() {}
    
    func mapping(map: Map) {
            content <- map["task"]
    }
}

extension Task: TaskPreviewCellProtocol {
    var title: String {
        return content.title
    }
    
    var dueDate: String {
        return content.dueDate
    }
    
    
}
