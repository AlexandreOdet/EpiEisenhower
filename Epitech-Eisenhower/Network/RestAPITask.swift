//
//  RestAPITask.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 09/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

fileprivate enum TaskError: Error {
    case networkError
    case invalidIdSupplied
}

class RestAPITask: RestAPIBase {
    func getTaskList() -> Observable<TaskList> {
        let taskList = TaskList()
        for i in 0...4 {
            let newTask = Task()
            newTask.id = i
            newTask.title = "Task \(i)"
            newTask.status = (i % 2 == 0) ? TaskType.toDo : TaskType.toDelegate
            taskList.tasks.append(newTask)
        }
        return Observable<TaskList>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            } else {
                observer.onNext(taskList)
                observer.onCompleted()
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func getData(forTask taskId: Int) -> Observable<Task> {
        return Observable<Task>.create({ observer -> Disposable in
            observer.onError(TaskError.invalidIdSupplied)
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func createTask() {
        
    }
    
    func deleteTask(_ taskId: Int) {
        
    }
    
    func updateTaskMember(ofTask taskId: Int, withMembers ids: [Int]) {
        
    }
}
