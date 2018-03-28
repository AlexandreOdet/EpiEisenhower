//
//  TaksRouter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class TaskRouter {
    var view: TaskDetailViewController?
    
    static func buildModule(forTask id: Int) -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.identifiers.viewControllers.taskDetailViewControllerIdentifier) as! TaskDetailViewController
        let presenter = TaskPresenter()
        let interactor = TaskInteractor()
        let router = TaskRouter()
        
        
        router.view = viewController
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.taskId = id
        
        interactor.output = presenter
        
        viewController.presenter = presenter
        return viewController
    }
    
    func goToMemberList(ofTask taskId: Int) {
        let nextViewController = UserListRouter.buildModule(with: taskId)
        view?.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
