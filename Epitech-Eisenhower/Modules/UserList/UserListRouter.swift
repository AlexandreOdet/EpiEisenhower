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
    
    static func buildModule(with taskId: Int) -> UIViewController {
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
        let nextViewController = ProfileRouter.buildModule(withDelegate: nil, forUser: id)
        view?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func presentSearchBar() {
        let searchController = { () -> UISearchController in
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.delegate = view
            controller.dimsBackgroundDuringPresentation = false
            controller.hidesNavigationBarDuringPresentation = false
            controller.searchBar.sizeToFit()
            return controller
        }()
        view?.present(searchController, animated: false, completion: nil)
    }
    
    func popBack() {
        view?.navigationController?.popViewController(animated: true)
    }
}
