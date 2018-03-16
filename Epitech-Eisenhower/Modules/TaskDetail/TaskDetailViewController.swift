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
    
    @IBOutlet weak var taskDescriptionTextView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TaskDetailViewController.viewDidLoad() with configuration: isEditingTask: \(isEditingTask)  with taskId: \(taskId)")
        title = (isEditingTask) ? Constants.titles.taskEditionTitle : Constants.titles.taskCreationTitle
        setUpTextView()
    }
    
    private func setUpTextView() {
        taskDescriptionTextView?.textContainer.maximumNumberOfLines = 3
        taskDescriptionTextView?.delegate = self
    }
    
}

extension TaskDetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textView.centerTextVertically()
    }
}

extension TaskDetailViewController: Networkable {
    typealias Object = Task
    
    func displayDataOnResponse(data: Task) {
        //To-Do
    }
}
