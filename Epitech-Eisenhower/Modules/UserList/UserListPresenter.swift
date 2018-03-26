//
//  UserListPresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 23/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class UserListPresenter {
    var view: UserListViewController?
    var interactor: UserListInteractor?
    var router: UserListRouter?
    
    func fetchMembersFrom(task id: Int) {
        view?.showSpinner()
        interactor?.fetchData(forTask: id)
    }
}

extension UserListPresenter: Output {
    
    typealias Object = UserList
    
    func didFetch(result: UserList) {
        view?.hideSpinner()
        view?.displayDataOnResponse(data: result)
    }
    
    func didFail(with error: Error?) {
        view?.hideSpinner()
        view?.displayAlertOnError()
    }
}
