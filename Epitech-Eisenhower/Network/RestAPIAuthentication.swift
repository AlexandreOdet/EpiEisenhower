//
//  RestAPIAuthentication.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum LoginError: Error {
    case invalidInput
}

class RestAPIAuthentication: RestAPIBase {
    
    func signIn(email: String, password: String) -> Observable<User> {
        let user = User()
        return Observable<User>.create({ observer -> Disposable in
            if email != "test" && password != "test" {
                observer.onError(LoginError.invalidInput)
                observer.onCompleted()
            } else {
                observer.onNext(user)
                observer.onCompleted()
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func signUp(email: String, password: String) -> Observable<User> {
        let user = User()
        return Observable<User>.create({ observer -> Disposable in
            if email.isEmpty || password.isEmpty {
                observer.onError(LoginError.invalidInput)
                observer.onCompleted()
            } else {
                observer.onNext(user)
                observer.onCompleted()
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
}
