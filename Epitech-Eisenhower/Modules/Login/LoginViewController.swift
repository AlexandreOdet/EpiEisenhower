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
    typealias Object = User

    func displayDataOnResponse(data: User) {
        //DisplayData if needed
    }
}
