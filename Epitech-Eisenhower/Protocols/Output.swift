//
//  Output.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 07/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

@objc protocol Output {
    associatedtype Object
    
    func dataFetched(result: Object)
    optional func dataFeteched(results: [Object])
    func errorOnRequest(error: Error?)
}
