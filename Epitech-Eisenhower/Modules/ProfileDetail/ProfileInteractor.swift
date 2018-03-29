//
//  ProfileInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import RxSwift

final class ProfileInteractor {
    var output: ProfilePresenter?
    
    let restApiUser = RestAPIUser()
    
    private lazy var disposeBag = DisposeBag()
    
    deinit {
        restApiUser.cancelRequest()
    }
    
    func fetchData(forUser userId: Int) {
        restApiUser.getInfos(ofUser: userId).subscribe(
            onNext: { user in
                self.output?.didFetch(result: user)
        }, onError: { error in
                self.output?.didFail(with: error)
        }).disposed(by: disposeBag)
    }
    
    func updateData(forUser userId: Int) {
        restApiUser.updateInfos(forUser: userId)
    }
    
    func logout(user userId: Int) {
        UserDefaults.standard.set(false, forKey: Constants.keys.isLoggedKey)
        UserDefaults.standard.set(-1, forKey: Constants.keys.userIdKey)
        UserDefaults.standard.synchronize()
        output?.didReceiveLogoutResponse()
    }
}
