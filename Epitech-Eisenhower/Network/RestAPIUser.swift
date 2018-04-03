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
import AlamofireObjectMapper

fileprivate enum UserError: Error {
    case invalidIdSupplied
}

final class RestAPIUser: RestAPIBase {
    
    func getInfos(ofUser userId: Int) -> Observable<User> {
        return Observable<User>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            }
            if userId == -1 {
                observer.onError(UserError.invalidIdSupplied)
            } else {
                self.request = Alamofire.request(RoutesAPI.profile.url + "\(userId)", method: .get, headers: self.headers)
                    .responseObject(completionHandler: {
                        (response: DataResponse<User>) in
                        switch response.result {
                        case .success(let user):
                            observer.onNext(user); observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    })
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func updateInfos(forUser userId: Int, withInfos user: UserContent) -> Observable<User> {
        return Observable<User>.create({ observer -> Disposable in
            if !self.isNetworkAvailable {
                observer.onError(Network.unreachable)
            }
            if userId == -1 {
                observer.onError(UserError.invalidIdSupplied)
            } else {
                self.request = Alamofire.request(RoutesAPI.profile.url + "\(userId)", method: .patch, parameters: user.toJSON(), encoding: JSONEncoding.default, headers: self.headers)
                    .responseObject(completionHandler: {
                        (response: DataResponse<User>) in
                        switch response.result {
                        case .success(let user):
                            observer.onNext(user); observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    })
            }
            return Disposables.create(with: { self.cancelRequest() })
        })
    }
    
    func searchUsers(withName name: String) {
        
    }
    
    func logout() {
        request = Alamofire.request(RoutesAPI.logout.url, method: .post, headers: headers)
    }
}
