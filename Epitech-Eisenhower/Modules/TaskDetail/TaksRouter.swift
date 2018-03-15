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
    
    static func buildModule() -> UIViewController {
        let viewController = TaskDetailViewController()
        let presenter = TaskPresenter()
        let interactor = TaskInteractor()
        let router = TaskRouter()
        
        
        router.view = viewController
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        viewController.presenter = presenter
        return viewController
    }
}
