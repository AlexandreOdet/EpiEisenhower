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
    
    func viewDidLoad() {
        view?.showSpinner()
        interactor?.fetchData()
    }
    
    
    func didTapLogoutButton() {
        
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
