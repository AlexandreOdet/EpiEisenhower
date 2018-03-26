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
    
    
    @IBOutlet weak var tableView: UITableView?
    
    var users = [User]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        if taskId == -1 {
            fatalError("That shouldn't be possible.")
        }
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
        return UITableViewCell()
    }
}

extension UserListViewController: Networkable {
    
    typealias Object = UserList
    
    func displayDataOnResponse(data: UserList) {
        //To-Do
    }
}
