//
//  LoginRouter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 09/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter {
    
    var view: LoginViewController?
    
    static func buildModule() -> UIViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.ouput = presenter
        
        router.view = viewController
        return viewController
    }
    
}
