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
    func displayNetworkUnreachableAlert()
}

extension Networkable where Self: UIViewController {
    func displayAlertOnError() {
        let alert = UIAlertController(title: "Erreur", message: "Oups, quelque chose s'est mal passé...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner() {
        SwiftOverlays.showBlockingWaitOverlayWithText("Chargement des données...")
    }
    
    func hideSpinner() {
        SwiftOverlays.removeAllBlockingOverlays()
    }
    
    func displayNetworkUnreachableAlert() {
        let alert = UIAlertController(title: "Erreur", message: "Il semblerait que le réseau ne soit pas disponible.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
