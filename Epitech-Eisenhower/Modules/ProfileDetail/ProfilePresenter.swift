//
//  ProfilePresenter.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 13/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

final class ProfilePresenter {
    var interactor: ProfileInteractor?
    var view: ProfileDetailViewController?
    var router: ProfileRouter?
    var userId: Int = -1
    
    weak var logoutDelegate: Exitable? = nil
    
    func viewDidLoad() {
        if UserDefaults.standard.integer(forKey: Constants.keys.userIdKey) == userId && logoutDelegate != nil {
            view?.isCurrentUser = true
        } else {
            view?.isCurrentUser = false
        }
        view?.showSpinner()
        interactor?.fetchData(forUser: userId)
    }
    
    
    func didTapLogoutButton() {
       interactor?.logout(user: userId)
    }
    
    func didReceiveLogoutResponse() {
        router?.popController(toRootController: true, withCompletion: {
            self.logoutDelegate?.didLogout()
        })
    }
    
    func didTapProfileImage() {
        router?.presentProfilePictureAlert(withCompletion: { [unowned self] picture in
            self.didSelect(picture: picture)
        })
    }
    
    private func didSelect(picture: ProfilePicture) {
        view?.userDidSelect(profilePicture: picture)
    }
    
    func didTapUpdateProfileButton() {
        interactor?.updateData(forUser: userId)
    }
}

extension ProfilePresenter: Output {
    typealias Object = User
    
    func didFetch(result: User) {
        view?.hideSpinner()
        view?.displayDataOnResponse(data: result)
    }
    
    func didFail(with error: Error?) {
        view?.hideSpinner()
        if error is Network {
            view?.displayNetworkUnreachableAlert()
        } else {
            view?.displayAlertOnError()
        }
    }
}
