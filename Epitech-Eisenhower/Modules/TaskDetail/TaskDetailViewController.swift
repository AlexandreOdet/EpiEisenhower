//
//  TaskDetailViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class TaskDetailViewController: UIViewController {
    var presenter: TaskPresenter?
    var isEditingTask: Bool = false
    var taskId: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TaskDetailViewController.viewDidLoad() with configuration: isEditingTask: \(isEditingTask)  with taskId: \(taskId)")
    }
}

extension TaskDetailViewController: Networkable {
    typealias Object = Task
    
    func displayDataOnResponse(data: Task) {
        //To-Do
    }
}
