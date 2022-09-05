//
//  Refer Home View Controller.swift
//  Community Connections Lewisham
//
//  Created by cex on 11/07/2022.
//

import Foundation
import UIKit

class ReferHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReferralForm.referral = ReferralForm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logoutPressed(sender:)))
        self.tabBarController?.navigationItem.title = "Make a Referral"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        ReferralForm.referral = ReferralForm()
    }
}
