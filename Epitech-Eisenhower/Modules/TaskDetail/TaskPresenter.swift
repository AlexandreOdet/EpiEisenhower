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
    
    func fetchData() {
        //interactor?.fetchData()
    }
    
    func didTapMoreImage(ofTask taskId: Int) {
        router?.goToMemberList(ofTask: taskId)
    }
}
