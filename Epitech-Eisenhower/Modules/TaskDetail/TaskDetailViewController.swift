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
    
    @IBOutlet weak var taskTitleTextView: UITextView?
    @IBOutlet weak var showTaskMemberImage: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TaskDetailViewController.viewDidLoad() with configuration: isEditingTask: \(isEditingTask)  with taskId: \(taskId)")
        title = (isEditingTask) ? Constants.titles.taskEditionTitle : Constants.titles.taskCreationTitle
        setUpTextView()
        setUpImageView()
    }
    
    private func setUpTextView() {
        taskTitleTextView?.textContainer.maximumNumberOfLines = 3
        taskTitleTextView?.textContainer.lineBreakMode = .byWordWrapping
        taskTitleTextView?.delegate = self
        if !isEditingTask {
            taskTitleTextView?.text = Constants.placeholders.taskTitlePlaceholder
            taskTitleTextView?.textColor = UIColor.veryLightGray
        }
    }
    
    private func setUpImageView() {
        showTaskMemberImage?.roundImage()
        showTaskMemberImage?.backgroundColor = .white
        showTaskMemberImage?.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapMoreImage))
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        showTaskMemberImage?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTapMoreImage() {
        print("DidTapMoreImage")
        presenter?.didTapMoreImage()
    }
    
}

extension TaskDetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.veryLightGray && textView.text == Constants.placeholders.taskTitlePlaceholder {
            textView.text = ""
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            taskTitleTextView?.text = Constants.placeholders.taskTitlePlaceholder
            taskTitleTextView?.textColor = UIColor.veryLightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.centerTextVertically()
    }
}

extension TaskDetailViewController: Networkable {
    typealias Object = Task
    
    func displayDataOnResponse(data: Task) {
        //To-Do
        taskTitleTextView?.text = data.title
    }
}
