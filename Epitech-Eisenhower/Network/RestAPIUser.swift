//
//  RestAPIUser.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum UserError: Error {
    case invalidIdSupplied
}

class RestAPIUser: RestAPIBase {
    
    func getInfos(ofUser userId: Int) -> Observable<User> {
        let user = User()
        user.name = "Odet Alexandre"
        user.description = "Lorem Ipsum"
        user.email = "alexandre.odet@viseo.com"
        return Observable<User>.create({ observer -> Disposable in
            if userId == -1 {
                observer.onError(UserError.invalidIdSupplied)
            } else {
                observer.onNext(user)
                observer.onCompleted()
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func updateInfos(forUser userId: Int) {
        
    }
    
    func searchUsers(withName name: String) {
        
    }
}
