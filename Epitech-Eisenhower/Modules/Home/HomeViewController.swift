//
//  HomeViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    var presenter: HomePresenter?
    
    @IBOutlet weak private var collectionView: UICollectionView?
    
    private var taskList = [Task]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.titles.homeTitle
        view.backgroundColor = UIColor.epiBackgroundColor
        setUpCollectionView()
        
        presenter?.viewDidLoad()
        //setUpNavigationBarColor()
        setUpNavigationBarItem()
    }
    
    private func setUpCollectionView() {
        collectionView?.backgroundColor = .clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func setUpNavigationBarColor() {
        
    }
    
    private func setUpNavigationBarItem() {
        let rightBarButtonItem = UIBarButtonItem(image: R.image.profileIcon(), style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter?.didTapRightBarButtonItem()
    }
}

extension HomeViewController: Networkable {
    
    typealias Object = TaskList
    
    func displayDataOnResponse(data: TaskList) {
        taskList.removeAll()
        if data.tasks.count > 0 {
            taskList = data.tasks
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifiers.customCells.addCollectionViewCellIdentifier, for: indexPath) as! AddTaskCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifiers.customCells.taskCollectionViewCellIdentifier, for: indexPath) as! TaskPreviewCollectionViewCell
            cell.buildCell(withTask: taskList[indexPath.row - 1])
            cell.backgroundColor = .red
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
    
    
}

