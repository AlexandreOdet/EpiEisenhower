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
}

extension HomeViewController: Networkable {
    
    typealias Object = Task
    
    func displayAlertOnError() {
        let alert = UIAlertController(title: "Erreur", message: "Oups, quelque chose s'est mal passé...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func displayDataOnResponse(data: Task) {
        //To-Do
    }
}
