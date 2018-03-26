//
//  UserListRouter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 23/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class UserListRouter {
    var view: UserListViewController?
    
    static func buildModule(withTaskId taskId: Int) -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.identifiers.viewControllers.userListViewControllerIdentifier) as! UserListViewController
        let presenter = UserListPresenter()
        let interactor = UserListInteractor()
        let router = UserListRouter()
        
        router.view = viewController
        
        viewController.presenter = presenter
        viewController.taskId = taskId
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        return viewController
    }
    
    func goToUserProfile(withId id: Int) {
        //To-Do
    }
    
    func popBack() {
        view?.navigationController?.popViewController(animated: true)
    }
}
