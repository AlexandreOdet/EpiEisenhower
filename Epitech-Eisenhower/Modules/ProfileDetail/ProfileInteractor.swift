//
//  ProfileInteractor.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

class ProfileInteractor {
    var output: ProfilePresenter?
    
    let restApiUser = RestAPIUser()
    
    deinit {
        restApiUser.cancelRequest()
    }
    
    func fetchData(forUser userId: Int) {
        
    }
    
    func updateData(forUser userId: Int) {
        
    }
    
    func logout(user userId: Int) {
        UserDefaults.standard.set(false, forKey: Constants.keys.isLoggedKey)
        UserDefaults.standard.set(-1, forKey: Constants.keys.userIdKey)
        UserDefaults.standard.synchronize()
        output?.didReceiveLogoutResponse()
    }
}
