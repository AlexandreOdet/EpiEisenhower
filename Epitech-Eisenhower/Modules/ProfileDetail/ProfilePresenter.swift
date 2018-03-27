//
//  ProfilePresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class ProfilePresenter {
    var interactor: ProfileInteractor?
    var view: ProfileDetailViewController?
    var router: ProfileRouter?
    var userId: Int = -1
    
    weak var logoutDelegate: Exitable?
    
    func viewDidLoad() {
        if UserDefaults.standard.integer(forKey: Constants.keys.userIdKey) == userId {
            view?.isCurrentUser = true
        } else {
            view?.isCurrentUser = false
        }
//        view?.showSpinner()
//        interactor?.fetchData()
    }
    
    
    func didTapLogoutButton() {
        router?.popController(toRootController: true, withCompletion: {
            self.logoutDelegate?.didLogout()
        })
    }
    
    func didTapUpdateProfileButton() {
        
    }
}

extension ProfilePresenter: Output {
    typealias Object = User
    
    func didFetch(result: User) {
        view?.hideSpinner()
        view?.displayDataOnResponse(data: result)
    }
    
    func didFail(with error: Error?) {
        view?.hideSpinner()
        view?.displayAlertOnError()
    }
}
