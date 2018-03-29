//
//  TaskPresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

final class TaskPresenter {
    var interactor: TaskInteractor?
    var view: TaskDetailViewController?
    var router: TaskRouter?
    
    var taskId: Int = -1
    
    func fetchData() {
        interactor?.fetchData(ofTask: taskId)
        view?.showSpinner()
    }
    
    func didTapMoreImage() {
        router?.goToMemberList(ofTask: taskId)
    }
    
    func didTapCreateButton(with task: Task) {
        view?.showSpinner()
        interactor?.willCreate(task: task)
    }
    
    func didTapUpdateButton(with task: Task) {
        view?.showSpinner()
        interactor?.willUpdate(task: task)
    }
}

extension TaskPresenter: Output {
    
    typealias Object = Task
    
    func didFetch(result: Task) {
        view?.hideSpinner()
        view?.displayDataOnResponse(data: result)
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
