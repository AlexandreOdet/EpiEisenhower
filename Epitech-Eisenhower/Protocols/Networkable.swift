//
//  Networkable.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 07/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

protocol Networkable {
    
    associatedtype Object
    
    func displayAlertOnError()
    func displayDataOnResponse(data: Object)
}
