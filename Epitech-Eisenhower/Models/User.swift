//
//  User.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 03/04/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import ObjectMapper

final class User: Mappable {
    
    var content: UserContent!
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        content <- map["user"]
    }
}

extension User: UserPreviewCellProtocol {
    var id: Int { return content.id }
    
    var name: String { return content.name }
    
    var picture: String { return content.picture }
}
