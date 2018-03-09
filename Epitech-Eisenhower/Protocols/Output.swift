//
//  Output.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 07/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

protocol Output {
    associatedtype Object
    
    func didFetch(result: Object)
    func didFail(with error: Error?)
}
