//
//  ProfileRouter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit
import SCLAlertView

class ProfileRouter {
    
    var view: ProfileDetailViewController?
    
    private(set) var imagePickerCompletion: ((ProfilePicture) -> ())?
    
    static func buildModule(withDelegate delegate: Exitable? = nil, forUser userId: Int) -> UIViewController {
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
    
    func presentProfilePictureAlert(withCompletion completion: ((ProfilePicture) -> ())?) {
        imagePickerCompletion = completion
        
        let alert = UIAlertController(title: "Photo de profil", message: "Vous pouvez changer votre photo de profil.", preferredStyle: .actionSheet)
        let robotAction = UIAlertAction(title: "Robot", style: .default, handler: { _ in self.imagePickerCompletion?(.robot) })
        let ghostAction = UIAlertAction(title: "Fantôme", style: .default, handler: { _ in self.imagePickerCompletion?(.ghost) })
        let monkeyAction = UIAlertAction(title: "Singe", style: .default, handler: { _ in self.imagePickerCompletion?(.monkey)})
        
        robotAction.setValue(R.image.searching()?.withRenderingMode(.alwaysOriginal), forKey: "image")
        ghostAction.setValue(R.image.pacman()?.withRenderingMode(.alwaysOriginal), forKey: "image")
        monkeyAction.setValue(R.image.monkey()?.withRenderingMode(.alwaysOriginal), forKey: "image")
        
        alert.addAction(robotAction)
        alert.addAction(ghostAction)
        alert.addAction(monkeyAction)
        
        view?.present(alert, animated: true, completion: nil)
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
