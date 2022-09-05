//
//  ViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 13/06/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var LogoView: UIView!
    @IBOutlet weak var TextView: UIView!
    @IBOutlet weak var ButtonsView: UIView!
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var LogInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LogoView.alpha = 0
        TextView.alpha = 0
        ButtonsView.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.LogoView.alpha = 1
        }
        
        UIView.animate(withDuration: 1, delay: 1) {
            self.TextView.alpha = 1
        }
        
        UIView.animate(withDuration: 1, delay: 1.5) {
            self.ButtonsView.alpha = 1
        }
    }

}

