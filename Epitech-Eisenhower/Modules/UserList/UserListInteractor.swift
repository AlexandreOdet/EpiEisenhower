//
//  UserListInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 23/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import RxSwift

class UserListInteractor {
    var output: UserListPresenter?
    
    var restApiTask = RestAPITask()
    
    deinit {
        restApiTask.cancelRequest()
    }
    
    func fetchData(forTask taskId: Int) {

    }

    func updateMembersOf(task taskId: Int, withMembers ids: [Int]) {
        restApiTask.updateTaskMember(ofTask: taskId, withMembers: ids)
    }
    
}
