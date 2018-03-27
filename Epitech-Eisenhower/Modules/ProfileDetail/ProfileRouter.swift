//
//  ProfileRouter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class ProfileRouter {
    
    var view: ProfileDetailViewController?
    
    
    static func buildModule(withDelegate delegate: Exitable, forUser userId: Int) -> UIViewController {
        let router = ProfileRouter()
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()
        let view = R.storyboard.main().instantiateViewController(withIdentifier: Constants.identifiers.viewControllers.userProfileViewControllerIdentifier) as! ProfileDetailViewController
        
        router.view = view
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.logoutDelegate = delegate
        presenter.userId = userId
        
        interactor.output = presenter
        
        view.presenter = presenter
        
        return view
    }
    
    func popController(toRootController: Bool, withCompletion completion: (() -> ())? = nil) {
        if toRootController {
            view?.navigationController?.popToRootViewController(animated: true)
        } else {
            view?.navigationController?.popViewController(animated: true)
        }
        if let completionHandler = completion {
            completionHandler()
        }
    }
}
