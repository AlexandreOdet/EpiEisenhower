//
//  ProfileDetailViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

final class ProfileDetailViewController: UIViewController {
    var presenter: ProfilePresenter?
    
    @IBOutlet weak var logoutButton: UIButton?
    @IBOutlet weak var userProfileImage: UIImageView?
    @IBOutlet weak var nameTextfield: UITextField?
    @IBOutlet weak var emailTextfield: UITextField?
    @IBOutlet weak var descriptionTextView: UITextView?
    
    var isCurrentUser = true {
        didSet {
            logoutButton?.isHidden = !isCurrentUser
            nameTextfield?.isUserInteractionEnabled = isCurrentUser
            emailTextfield?.isUserInteractionEnabled = isCurrentUser
            descriptionTextView?.isUserInteractionEnabled = isCurrentUser
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImage?.round()
        presenter?.viewDidLoad()
        logoutButton?.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        if isCurrentUser {
            setUpRightBarButtonItem()
            title = Constants.titles.userProfileTitle
            setUpProfileImage()
        }
        descriptionTextView?.roundCorner()
    }
    
    private func setUpRightBarButtonItem() {
        let rightBarButtonItem = UIBarButtonItem(image: R.image.checked(), style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func setUpProfileImage() {
        userProfileImage?.isUserInteractionEnabled = true
        userProfileImage?.backgroundColor = .white
        userProfileImage?.contentMode = .scaleAspectFit
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapProfileImage))
        tapGestureRecognizer.numberOfTapsRequired = 1
        userProfileImage?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTapLogoutButton() {
        presenter?.didTapLogoutButton()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter?.didTapUpdateProfileButton()
    }
    
    @objc func didTapProfileImage() {
        presenter?.didTapProfileImage()
    }
    
    func userDidSelect(profilePicture picture: ProfilePicture) {
        userProfileImage?.image = picture.associatedImage
    }
}

extension ProfileDetailViewController: Networkable {
    typealias Object = User
    
    func displayDataOnResponse(data: User) {
        //To-Do
        if !isCurrentUser {
            title = data.name
        }
        nameTextfield?.text = data.name
        emailTextfield?.text = data.email
        descriptionTextView?.text = data.description
    }
}
