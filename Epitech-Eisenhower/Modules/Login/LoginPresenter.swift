//
//  LoginPresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    var interactor: LoginInteractor?
    
    var view: LoginViewController?
    
    var router: LoginRouter?
    
    func didTapSignInButton(email: String, password: String) {
        view?.showSpinner()
        interactor?.signIn(email: email, password: password)
    }
    
    func didTapSignUpButton(email: String, password: String) {
        view?.showSpinner()
        interactor?.signUp(email: email, password: password)
    }
    
    func loggedUser() {
        interactor?.saveUserId()
        router?.dismissLoginModule()
    }
}

extension LoginPresenter: Output {
    typealias Object = User
    
    func didFetch(result: User) {
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
