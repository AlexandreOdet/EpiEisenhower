//
//  LoginViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    
    @objc func didTapSignInButton() {
        presenter?.didTapSignInButton()
    }
    
    @objc func didTapSignUpButton() {
        presenter?.didTapSignUpButton()
    }
}

extension LoginViewController: Networkable  {
//    func displayAlertOnError() {
//        let alert = UIAlertController(title: "Erreur", message: "Oups, quelque chose s'est mal passé...", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
    
    func displayDataOnResponse(data: User) {
        //DisplayData if needed
    }
    
    typealias Object = User
    
    
}
