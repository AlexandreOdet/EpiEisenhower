//
//  ProfileDetailViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class ProfileDetailViewController: UIViewController {
    var presenter: ProfilePresenter?
    
    @IBOutlet weak var logoutButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton?.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
    }
    
    @objc func didTapLogoutButton() {
        presenter?.didTapLogoutButton()
    }
}

extension ProfileDetailViewController: Networkable {
    typealias Object = User
    
    func displayDataOnResponse(data: User) {
        //To-Do
    }
}
