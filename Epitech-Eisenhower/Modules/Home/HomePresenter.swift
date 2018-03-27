//
//  HomePresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class HomePresenter {
    
    var interactor: HomeInteractor?
    var view: HomeViewController?
    var router: HomeRouter?
    
    var taskList = [Task]()
    
    func viewDidLoad() {
        if UserDefaults.standard.bool(forKey: Constants.keys.isLoggedKey) {
            view?.showSpinner()
            interactor?.fetchData()
        } else {
            router?.presentLoginModule()
        }
    }
    
    func didSelectItem(at index: IndexPath) {
        if index.row == 0 {
            router?.goToTaskDetail(isEditing: false)
        } else {
            router?.goToTaskDetail(isEditing: true, taskId: taskList[index.row - 1].id)
        }
    }
    
    func didTapRightBarButtonItem() {
        router?.goToUserProfile(userID: 1, withDelegate: self)
    }
}

extension HomePresenter: Output {
    typealias Object = TaskList
    
    func didFail(with error: Error?) {
        view?.hideSpinner()
        view?.displayAlertOnError()
    }
    
    func didFetch(result: TaskList) {
        view?.hideSpinner()
        taskList = result.tasks
        view?.displayDataOnResponse(data: result)
    }
}

extension HomePresenter: Exitable {
    func didLogout() {
        router?.presentLoginModule()
    }
}
