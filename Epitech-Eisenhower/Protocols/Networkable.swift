//
//  Networkable.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 07/03/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation
import UIKit
import SwiftOverlays

protocol Networkable {
    
    associatedtype Object
    
    func displayAlertOnError()
    func displayDataOnResponse(data: Object)
    func showSpinner()
    func hideSpinner()
}

extension Networkable where Self: UIViewController {
    func displayAlertOnError() {
        let alert = UIAlertController(title: "Erreur", message: "Oups, quelque chose s'est mal passé...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner() {
        //showWaitOverlayWithText("Chargement des données...")
        SwiftOverlays.showBlockingWaitOverlayWithText("Chargement des données...")
    }
    
    func hideSpinner() {
        //removeAllOverlays()
        SwiftOverlays.removeAllBlockingOverlays()
    }
}
