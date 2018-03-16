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
    
    
    static func buildModule(withDelegate delegate: Exitable) -> UIViewController {
        let router = ProfileRouter()
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()
        let view = ProfileDetailViewController()
        
        router.view = view
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.logoutDelegate = delegate
        
        interactor.output = presenter
        
        view.presenter = presenter
        
        return view
    }
    
    func popController(withCompletion completion: (() -> ())? = nil) {
        view?.navigationController?.popToRootViewController(animated: true)
        if let completionHandler = completion {
            completionHandler()
        }
    }
}
