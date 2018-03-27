//
//  TaskDetailViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 15/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class TaskDetailViewController: UIViewController, Notifiable {
    var presenter: TaskPresenter?
    var isEditingTask: Bool = false
    
    var task = Task()
    
    @IBOutlet weak var taskTitleTextView: UITextView?
    @IBOutlet weak var showTaskMemberImage: UIImageView?
    @IBOutlet weak var taskDescriptionTextView: UITextView?
    @IBOutlet weak var taskDueDateTextField: UITextField?
    
    @IBOutlet weak var taskUpdateOrCreationButton: UIButton?
    
    let datePicker = UIDatePicker()
    
    deinit {
        stopObservingKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = (isEditingTask) ? Constants.titles.taskEditionTitle : Constants.titles.taskCreationTitle
        if isEditingTask {
            presenter?.fetchData()
        }
        startObservingKeyboard()
        setUpTextView()
        setUpImageView()
        setUpTextfieldInput()
        setUpBottomButton()
    }
    
    private func setUpTextView() {
        taskTitleTextView?.textContainer.maximumNumberOfLines = 3
        taskTitleTextView?.textContainer.lineBreakMode = .byWordWrapping
        taskTitleTextView?.delegate = self
        taskTitleTextView?.tag = 1
        
        taskDescriptionTextView?.textContainer.maximumNumberOfLines = 5
        taskDescriptionTextView?.textContainer.lineBreakMode = .byWordWrapping
        taskDescriptionTextView?.delegate = self
        taskDescriptionTextView?.tag = 2
        
        if !isEditingTask {
            taskTitleTextView?.text = Constants.placeholders.taskTitlePlaceholder
            taskTitleTextView?.textColor = UIColor.veryLightGray
            
            taskDescriptionTextView?.text = Constants.placeholders.taskDescriptionPlaceholder
            taskDescriptionTextView?.textColor = UIColor.veryLightGray
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
    
    private func setUpTextfieldInput() {
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancelButtonInToolbar))
        let leftSpacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(didTapDoneButtonInToolbar))
        
        toolbar.setItems([cancelButton, leftSpacing, doneButton], animated: true)
        taskDueDateTextField?.inputAccessoryView = toolbar
        taskDueDateTextField?.inputView = datePicker
    }
    
    private func setUpBottomButton() {
        taskUpdateOrCreationButton?.setTitleColor(.white, for: .normal)
        if isEditingTask {
            taskUpdateOrCreationButton?.backgroundColor = UIColor.epiOrange
            taskUpdateOrCreationButton?.setTitle("Update Task".uppercased(), for: .normal)
            taskUpdateOrCreationButton?.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
        } else {
            taskUpdateOrCreationButton?.backgroundColor = UIColor.epiYellow
            taskUpdateOrCreationButton?.setTitle("Create Task".uppercased(), for: .normal)
            taskUpdateOrCreationButton?.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        }
    }
    
    @objc func didTapDoneButtonInToolbar() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.formatting.dateFormat
        
        let stringifiedDate = dateFormatter.string(from: datePicker.date)
        taskDueDateTextField?.text = stringifiedDate
        task.dueDate = stringifiedDate
        taskDueDateTextField?.resignFirstResponder()
    }
    
    @objc func didTapCancelButtonInToolbar() {
        taskDueDateTextField?.resignFirstResponder()
    }
    
    @objc func didTapMoreImage() {
        presenter?.didTapMoreImage()
    }
    
    @objc func didTapCreateButton() {
        presenter?.didTapCreateButton(with: task)
    }
    
    @objc func didTapUpdateButton() {
        presenter?.didTapUpdateButton(with: task)
    }
}

extension TaskDetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.tag == 1 {
            if textView.textColor == UIColor.veryLightGray && textView.text == Constants.placeholders.taskTitlePlaceholder {
                textView.text = ""
                textView.textColor = .white
            }
        } else if textView.tag == 2 {
            if textView.textColor == UIColor.veryLightGray && textView.text == Constants.placeholders.taskDescriptionPlaceholder {
                textView.text = ""
                textView.textColor = .white
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1 {
            if textView.text.isEmpty {
                taskTitleTextView?.text = Constants.placeholders.taskTitlePlaceholder
                taskTitleTextView?.textColor = UIColor.veryLightGray
            }
        } else if textView.tag == 2 {
            if textView.text.isEmpty {
                taskTitleTextView?.text = Constants.placeholders.taskDescriptionPlaceholder
                taskTitleTextView?.textColor = UIColor.veryLightGray
            }
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
        task = data
        taskTitleTextView?.text = data.title
        taskDescriptionTextView?.text = "Mamène description du sale"
    }
}
