//
//  NavBar.swift
//  Community Connections Lewisham
//
//  Created by cex on 01/08/2022.
//

//import Foundation
//import UIKit
//import FirebaseAuth
//
//class NavBar: UINavigationBar {
//    
//    self.navigationItem.hidesBackButton = true
//    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logoutPressed(sender:)))
//    
//    @objc func logoutPressed(sender: UIBarButtonItem) {
//        
//        do {
//            try Auth.auth().signOut()
//            navigationController?.popToRootViewController(animated: true)
//            
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }
//    }
//}
