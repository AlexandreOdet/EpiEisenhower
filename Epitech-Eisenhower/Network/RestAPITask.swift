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
import AlamofireObjectMapper

fileprivate enum TaskError: Error {
    case networkError
    case invalidIdSupplied
}

final class RestAPITask: RestAPIBase {
    func getTaskList() -> Observable<TaskList> {
        print(RoutesAPI.task.url, headers)
        return Observable<TaskList>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            } else {
                self.request = Alamofire.request(RoutesAPI.task.url, method: .get, headers: self.headers)
                .responseObject(completionHandler: {
                    (response: DataResponse<TaskList>) in
                    switch response.result {
                    case .success(let tasks):
                        observer.onNext(tasks); observer.onCompleted()
                    case .failure(let error):
                        print(error)
                        observer.onError(error)
                    }
                })
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func getData(forTask taskId: Int) -> Observable<Task> {
        return Observable<Task>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            } else if taskId == -1 {
                observer.onError(TaskError.invalidIdSupplied)
            } else {
                self.request = Alamofire.request(RoutesAPI.task.url + "\(taskId)", method: .get, headers: self.headers)
                    .responseObject(completionHandler: {
                        (response: DataResponse<Task>) in
                        switch response.result {
                        case .success(let task):
                            observer.onNext(task); observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    })
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func createTask(withContent content: Task) -> Observable<Task> {
        return Observable<Task>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            } else {
                self.request = Alamofire.request(RoutesAPI.task.url, method: .post, parameters: content.toJSON(), encoding: JSONEncoding.default, headers: self.headers)
                    .responseObject(completionHandler: {
                        (response: DataResponse<Task>) in
                        switch response.result {
                        case .success(let task):
                            observer.onNext(task); observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    })
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func deleteTask(_ taskId: Int) {
        
    }
    
    func updateTaskMember(ofTask taskId: Int, withMembers ids: [Int]) {
        
    }
}
