//
//  TaskPresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class TaskPresenter {
    var interactor: TaskInteractor?
    var view: TaskDetailViewController?
    var router: TaskRouter?
    
    func fetchData(ofTask taskId: Int) {
        interactor?.fetchData(ofTask: taskId)
        view?.showSpinner()
    }
    
    func didTapMoreImage(ofTask taskId: Int) {
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
        view?.displayAlertOnError()
    }
}
