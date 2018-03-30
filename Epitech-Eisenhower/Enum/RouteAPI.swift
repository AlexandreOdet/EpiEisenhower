//
//  RouteAPI.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

fileprivate final class network {
    public class var apiBaseURL: String { return "https://eisenhower-ios.herokuapp.com/" }
    public class var loginURL: String { return "auth/login" }
    public class var signupURL: String { return "auth/register" }
    public class var taskURL: String { return "task/" }
    public class var profileURL: String { return "users/" }
    public class var logoutURL: String { return "auth/logout" }
}

enum RoutesAPI {
    
    static var base = network.apiBaseURL
    
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
                return network.loginURL
            case .signUp:
                return network.signupURL
            case .task:
                return network.taskURL
            case .profile:
                return network.profileURL
            case .logout:
                return network.logoutURL
            }
        }()
        return (RoutesAPI.base.appending(path))
    }
}
