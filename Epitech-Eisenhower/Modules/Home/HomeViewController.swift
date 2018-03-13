//
//  HomeViewController.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 06/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //var collectionView: UICollectionView!
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.titles.homeTitle
        presenter?.viewDidLoad()
    }
}

extension HomeViewController: Networkable {
    
    typealias Object = Task
    
    func displayDataOnResponse(data: Task) {
        //To-Do
        //collectionView.reloadData()
    }
}

//extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//
//}

