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

class RestAPIAuthentication: RestAPIBase {
    
    func signIn() -> Observable<User> {
        let user = User()
        return Observable<User>.create({ observer -> Disposable in
            observer.onNext(user)
            observer.onCompleted()
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func signUp() -> Observable<User> {
        let user = User()
        return Observable<User>.create({ observer -> Disposable in
            observer.onNext(user)
            observer.onCompleted()
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
}
