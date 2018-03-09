//
//  LoginInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import RxSwift

class LoginInteractor {
    
    var ouput: LoginPresenter?
    
    private lazy var disposeBag = DisposeBag()
    
    deinit {
        raAuthentication.cancelRequest()
    }
    
    let raAuthentication = RestAPIAuthentication()
    
    func signIn() {
        raAuthentication.signIn().subscribe(
            onNext: { user in
            self.ouput?.didFetch(result: user)
        }, onError: { error in
            self.ouput?.didFail(with: error)
        }).disposed(by: disposeBag)
    }
    
    func signUp() {
        raAuthentication.signUp().subscribe(
            onNext: { user in
            self.ouput?.didFetch(result: user)
        }, onError: { error in
            self.ouput?.didFail(with: error)
        }).disposed(by: disposeBag)
    }
}
