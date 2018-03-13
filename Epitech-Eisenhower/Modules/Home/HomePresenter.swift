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
    
    func viewDidLoad() {
        if UserDefaults.standard.bool(forKey: Constants.keys.isLoggedKey) {
            interactor?.fetchData()
        } else {
            router?.presentLoginModule()
        }
    }
    
    func didSelectItem(at index: IndexPath) {
        
    }
}

extension HomePresenter: Output {
    typealias Object = Task
    
    func didFail(with error: Error?) {
        view?.displayAlertOnError()
    }
    
    func didFetch(result: Task) {
        view?.displayDataOnResponse(data: result)
    }
    
}
