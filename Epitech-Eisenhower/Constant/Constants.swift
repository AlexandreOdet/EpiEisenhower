//
//  Constants.swift
//  Epitech-Eisenhower
//
//  Created by Odet Alexandre on 27/02/2018.
//  Copyright © 2018 Odet Alexandre. All rights reserved.
//

import Foundation

final class Constants {
    final class formatting {
        public class var swiftEmailRegex: String { return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" }
    }
    
    final class identifiers {
        public class var loginViewControllerIdentifier: String { return "LoginViewController" }
        public class var homeViewControllerIdentifier: String { return "HomeViewController" }
        
        public class var taskCollectionViewCellIdentifier: String { return "HomeCollectionViewCellIdentifier" }
        public class var addCollectionViewCellIdentifier: String { return "HomeAddCollectionViewCellIdentifier" }
    }
    
    final class keys {
        public class var isLoggedKey: String { return "isLogged" }
    }
    
    final class titles {
        public class var loginTitle: String { return "Login" }
        public class var homeTitle: String { return "Home" }
    }
    
}
