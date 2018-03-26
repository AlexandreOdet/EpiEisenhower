//
//  UserListViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 23/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class UserListViewController: UIViewController {
    var presenter: UserListPresenter?
    var taskId = -1
    var didTapBackButton: Bool = false
    
    let emptyLabel = UILabel()
    
    @IBOutlet weak var tableView: UITableView?
    
    var users = [User]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        setUpEmptyLabel()
        if taskId != -1 {
            presenter?.fetchMembersFrom(task: taskId)
        }
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorInset = UIEdgeInsets.zero
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            let usersIds = users.flatMap({ $0.id })
            presenter?.updateMembers(ofTask: taskId, withMembers: usersIds)
            didTapBackButton = true
        }
    }
    
    func displayEmptyContentView() {
        tableView?.backgroundView = emptyLabel
        tableView?.separatorStyle = .none
    }
    
    private func setUpEmptyLabel() {
        if taskId == -1 {
            emptyLabel.text = "Vous pouvez ajouter des membres ici."
        } else {
            emptyLabel.text = "Aucun membre disponible."
        }
        emptyLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        emptyLabel.textAlignment = .center
        emptyLabel.sizeToFit()
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifiers.customCells.taskMemberTableViewCellIdentifier) as! UserListTableViewCell
        cell.buildCell(with: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
}

extension UserListViewController: Networkable {
    
    typealias Object = UserList
    
    func displayDataOnResponse(data: UserList) {
        if didTapBackButton {
            presenter?.popBack()
            didTapBackButton = false
        } else {
            users = data.users
        }
    }
}
