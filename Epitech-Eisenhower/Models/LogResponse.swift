//
//  LogResponse.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 29/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import ObjectMapper

final class LogResponse: Mappable {
    var key = ""
    var id = -1
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        key <- map["key"]
        id <- map["id"]
    }
}
