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
    
    func didTapSignInButton() {
        interactor?.signIn()
    }
    
    func didTapSignUpButton() {
        interactor?.signUp()
    }
}

extension LoginPresenter: Output {
    typealias Object = User
    
    func didFetch(result: User) {
        view?.displayDataOnResponse(data: result)
    }
    
    func didFail(with error: Error?) {
        view?.displayAlertOnError()
    }
}
