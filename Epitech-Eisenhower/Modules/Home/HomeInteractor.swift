//
//  HomeInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class HomeInteractor {
    
    deinit {
        restApiTask.cancelRequest()
    }
    
    var output: HomePresenter?
    var restApiTask = RestAPITask()
    
    func fetchData() {
        /*restApiTask.fetchData()
         .onNext({ tasks in
            output?.didFetch(result: tasks)
         }).onError({ error in
            output?.didFail(with: error)
         })*/
        let taskList = TaskList()
        for i in 0...4 {
            let newTask = Task()
            newTask.id = i
            newTask.title = "Task \(i)"
            newTask.status = (i % 2 == 0) ? TaskType.toDo : TaskType.toDelegate
            taskList.tasks.append(newTask)
        }
        output?.didFetch(result: taskList)
    }
}
