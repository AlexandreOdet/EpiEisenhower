//
//  RouteAPI.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

enum RoutesAPI {
    
    static var base = Constants.network.apiBaseURL
    
    case login
    case signUp
    case task
    case profile
    case logout
}

extension RoutesAPI {
    var url: String {
        let path: String = {
            switch self {
            case .login:
                return Constants.network.loginURL
            case .signUp:
                return Constants.network.signupURL
            case .task:
                return Constants.network.taskURL
            case .profile:
                return Constants.network.profileURL
            case .logout:
                return Constants.network.logoutURL
            }
        }()
        return (RoutesAPI.base.appending(path))
    }
}
