//
//  TaskInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

final class TaskInteractor {
    var output: TaskPresenter?
    
    private var restApiTask = RestAPITask()
    
    deinit {
        restApiTask.cancelRequest()
    }
    
    func fetchData(ofTask taskId: Int) {
        
    }
    
    func willUpdate(task: Task) {
        
    }
    
    func willCreate(task: Task) {
        
    }
}
