//
//  InfoViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 01/08/2022.
//

import Foundation
import UIKit
import FirebaseAuth

class InfoViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logoutPressed(sender:)))
        self.tabBarController?.navigationItem.title = "What is CCL?"
    }
}
