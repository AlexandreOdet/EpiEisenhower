//
//  UserListInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 23/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import RxSwift

final class UserListInteractor {
    var output: UserListPresenter?
    
    var restApiTask = RestAPITask()
    
    private lazy var disposeBag = DisposeBag()
    
    deinit {
        restApiTask.cancelRequest()
    }
    
    func fetchData(forTask taskId: Int) {
        restApiTask.getData(forTask: taskId).subscribe(
            onNext: { task in self.output?.didFetch(result: UserList())
        }, onError: { error in self.output?.didFail(with: error)
        }).disposed(by: disposeBag)
    }

    func updateMembersOf(task taskId: Int, withMembers ids: [Int]) {
        restApiTask.updateTaskMember(ofTask: taskId, withMembers: ids)
        output?.didFetch(result: UserList())
    }
    
}
