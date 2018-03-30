//
//  LoginViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    
    @IBOutlet weak private var emailTextField: UITextField?
    @IBOutlet weak private var passwordTextField: UITextField?
    @IBOutlet weak private var loginButton: UIButton?
    @IBOutlet weak private var signUpButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton?.roundCorner()
        loginButton?.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        signUpButton?.roundCorner()
        signUpButton?.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        title = Constants.titles.loginTitle
        
        emailTextField?.tag = 0
        passwordTextField?.tag = 1
        
        emailTextField?.delegate = self
        passwordTextField?.delegate = self
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.tag == 0 {
            let nextTextField = view.viewWithTag(textField.tag + 1)
            nextTextField?.becomeFirstResponder()
        }
        if textField.tag == passwordTextField?.tag {
            view.endEditing(true)
        }
        return true
    }
}

extension LoginViewController: Networkable  {
    typealias Object = LogResponse

    func displayDataOnResponse(data: LogResponse) {
        print("Response: \(data.id), \(data.key)")
        presenter?.loggedUser(withId: data.id, withAuthenticationToken: data.key)
    }
}
