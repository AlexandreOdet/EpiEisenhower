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
    
    func fetchData(forTask taskId: Int) {
        if taskId == -1 {
            output?.didFetch(result: UserList())
        } else {
            let userList = UserList()
            for i in 0 ... 6 {
                let user = User()
                user.name = "User \(i)"
                user.id = i
                userList.users.append(user)
            }
            output?.didFetch(result: userList)
        }
    }

    func updateMembersOf(task taskId: Int, withMembers ids: [Int]) {
        
    }
    
}
