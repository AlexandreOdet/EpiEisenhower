//
//  LoginRouter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 09/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

final class LoginRouter {
    
    var view: LoginViewController?
    
    static func buildModule() -> UIViewController {
        let viewController = R.storyboard.main().instantiateViewController(withIdentifier: Constants.identifiers.viewControllers.loginViewControllerIdentifier) as! LoginViewController
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
    
    func dismissLoginModule() {
        view?.dismiss(animated: true, completion: nil)
    }
    
}
