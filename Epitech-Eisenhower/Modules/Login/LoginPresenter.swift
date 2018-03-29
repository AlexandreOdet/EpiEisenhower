//
//  LoginPresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

final class LoginPresenter {
    
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
    
    func loggedUser(withId id: Int, withAuthenticationToken token: String) {
        interactor?.save(userId: id, userToken: token)
        router?.dismissLoginModule()
    }
}

extension LoginPresenter: Output {
    typealias Object = LogResponse
    
    func didFetch(result: LogResponse) {
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
