//
//  User.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import ObjectMapper

final class User: Mappable, UserPreviewCellProtocol {
    var id = 0
    var name = ""
    var description = ""
    var email = ""
    var picture = ""
    
    init?(map: Map) {}
    
    init() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["username"]
        email <- map["email"]
        picture <- map["picture"]
    }
}
