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
    
    @IBOutlet weak private var logoutButton: UIButton?
    @IBOutlet weak private var userProfileImage: UIImageView?
    @IBOutlet weak private var nameTextfield: UITextField?
    @IBOutlet weak private var emailTextfield: UITextField?
    @IBOutlet weak private var descriptionTextView: UITextView?
    
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
        var pictureName = ""
        switch userProfileImage?.image {
        case R.image.searching():
            pictureName = "robot"
        case R.image.monkey():
            pictureName = "monkey"
        case R.image.pacman():
            pictureName = "ghost"
        default:
            pictureName = ""
        }
        presenter?.didTapUpdateProfileButton(withName: nameTextfield?.text ?? "",
        profilePicture: pictureName, description: descriptionTextView?.text ?? "",
        email: emailTextfield?.text ?? "")
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
            title = data.content.name
        }
        nameTextfield?.text = data.content.name
        emailTextfield?.text = data.content.email
        descriptionTextView?.text = data.content.description
        switch data.content.picture {
        case "robot":
            userProfileImage?.image = R.image.searching()
        case "monkey":
            userProfileImage?.image = R.image.monkey()
        case "ghost":
            userProfileImage?.image = R.image.pacman()
        default:
            userProfileImage?.image = R.image.profilePlaceholder()
        }
    }
}
