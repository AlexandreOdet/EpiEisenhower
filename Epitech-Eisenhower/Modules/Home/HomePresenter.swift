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
            interactor?.fetchData()
        } else {
            router?.presentLoginModule()
        }
    }
    
    func didSelectItem(at index: IndexPath) {
        print("index = ", index.row)
        if index.row == 0 {
            router?.goToTaskDetail(isEditing: false)
        } else {
            print(taskList[index.row - 1].id)
            router?.goToTaskDetail(isEditing: true, taskId: taskList[index.row - 1].id)
        }
    }
    
    func didTapRightBarButtonItem() {
        //To-Do router?.goToUserProfile()
        print("DidTapRightBarButtonItem")
    }
}

extension HomePresenter: Output {
    typealias Object = TaskList
    
    func didFail(with error: Error?) {
        view?.displayAlertOnError()
    }
    
    func didFetch(result: TaskList) {
        taskList = result.tasks
        view?.displayDataOnResponse(data: result)
    }
    
}
