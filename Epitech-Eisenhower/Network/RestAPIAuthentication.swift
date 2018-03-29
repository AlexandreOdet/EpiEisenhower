//
//  RestAPIAuthentication.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

fileprivate enum LoginError: Error {
    case invalidInput
}

final class RestAPIAuthentication: RestAPIBase {
    
    func signIn(email: String, password: String) -> Observable<LogResponse> {
        var paramaters = ["email":email]
        paramaters["password"] = password
        return Observable<LogResponse>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            }
            self.request = Alamofire.request(RoutesAPI.login.url,
                                             method: .post,
                                             parameters: paramaters,
                                             encoding: JSONEncoding.default)
                .validate()
                .responseObject(completionHandler: {
                    (response: DataResponse<LogResponse>) in
                    switch response.result {
                    case .success(let response):
                        observer.onNext(response); observer.onCompleted()
                    case .failure(let error):
                        print("Error = \(error)")
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func signUp(email: String, password: String) -> Observable<LogResponse> {
        var paramaters = ["email":email]
        paramaters["password"] = password
        return Observable<LogResponse>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            }
            self.request = Alamofire.request(RoutesAPI.signUp.url,
                                             method: .post,
                                             parameters: paramaters,
                                             encoding: JSONEncoding.default)
                .validate()
                .responseObject(completionHandler: {
                    (response: DataResponse<LogResponse>) in
                    switch response.result {
                    case .success(let response):
                        observer.onNext(response); observer.onCompleted()
                    case .failure(let error):
                        print("Error = \(error)")
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
}
