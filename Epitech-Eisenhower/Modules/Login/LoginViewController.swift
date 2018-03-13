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
    
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet weak var signUpButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton?.roundCorner()
        loginButton?.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        signUpButton?.roundCorner()
        signUpButton?.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        title = Constants.titles.loginTitle
    }
    
    @objc func didTapSignInButton() {
        let email = emailTextField?.text ?? ""
        let password = passwordTextField?.text ?? ""
        presenter?.didTapSignInButton(email: email, password: password)
    }
    
    @objc func didTapSignUpButton() {
        let email = emailTextField?.text ?? ""
        let password = passwordTextField?.text ?? ""
        presenter?.didTapSignUpButton(email: email, password: password)
    }
}

extension LoginViewController: Networkable  {
    typealias Object = User

    func displayDataOnResponse(data: User) {
        presenter?.loggedUser()
    }
}
