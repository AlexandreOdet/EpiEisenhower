//
//  UserListPresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 23/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

final class UserListPresenter {
    weak var view: UserListViewController?
    var interactor: UserListInteractor?
    var router: UserListRouter?
    var taskId = -1
    
    var userList = UserList() {
        didSet {
            if userList.users.isEmpty {
                view?.displayEmptyContentView()
            } else {
                view?.displayDataOnResponse(data: userList)
            }
        }
    }
    
    func fetchMembersFromTask() {
        view?.showSpinner()
        interactor?.fetchData(forTask: taskId)
    }
    
    func removeUserFromMemberList(at indexPath: IndexPath) {
        userList.users.remove(at: indexPath.row)
    }
    
    func updateMembersOfTask(withMembers ids: [Int]) {
        view?.showSpinner()
        interactor?.updateMembersOf(task: taskId, withMembers: ids)
    }
    
    func popBack() {
        router?.popBack()
    }
    
    func didRemove(userAt indexPath: IndexPath) {
        userList.users.remove(at: indexPath.row)
        if userList.users.isEmpty {
            view?.displayEmptyContentView()
        } else {
            view?.displayDataOnResponse(data: userList)
        }
    }
    
    func didSelect(userAt indexPath: IndexPath) {
        router?.goToUserProfile(withId: userList.users[indexPath.row].id)
    }
    
    func didAddUserToMemberList() {
        
    }
    
    func didTapRightBarButtonItem() {
        router?.presentSearchBar()
    }
}

extension UserListPresenter: Output {
    
    typealias Object = UserList
    
    func didFetch(result: UserList) {
        view?.hideSpinner()
        userList = result
    }
    
    func didFail(with error: Error?) {
        view?.hideSpinner()
        if error is Network {
            view?.displayNetworkUnreachableAlert()
        } else {
            view?.displayAlertOnError()
        }
    }
}
