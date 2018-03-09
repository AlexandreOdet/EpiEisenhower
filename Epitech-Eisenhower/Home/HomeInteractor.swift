//
//  HomeInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class HomeInteractor {
    
    deinit {
        restApiTask.cancelRequest()
    }
    
    var output: HomePresenter?
    var restApiTask = RestAPITask()
    
    func fetchData() {
        /*restApiTask.fetchData()
         .onNext({ tasks in
            output?.didFetch(result: tasks)
         }).onError({ error in
            output?.didFail(with: error)
         })*/
    }
}
