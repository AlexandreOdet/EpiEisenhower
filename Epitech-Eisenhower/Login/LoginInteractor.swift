//
//  LoginInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class LoginInteractor {
    
    var ouput: LoginPresenter?
    
    deinit {
        raAuthentication.cancelRequest()
    }
    
    let raAuthentication = RestAPIAuthentication()
    
    func signIn() {
////        raAuthentication.signIn().onNext({ response in
//        //            output?.didFetch(result: response)
//        //        }).onError({ error in
        //                    output?.didFail(with: error)
//    // })
    }
    
    func signUp() {
        ////        raAuthentication.signUp().onNext({ response in
        //        //            output?.didFetch(result: response)
        //        //        }).onError({ error in
        //                    output?.didFail(with: error)
        //    // })
    }
}
