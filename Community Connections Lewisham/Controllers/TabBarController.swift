//
//  TabBarController.swift
//  Community Connections Lewisham
//
//  Created by cex on 01/08/2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
}
