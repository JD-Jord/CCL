//
//  HomeViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 04/07/2022.
//

import Foundation
import UIKit
import FirebaseAuth
import WebKit


class HomeViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var welcomeVideo: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(self.logoutPressed(sender:)))
        self.tabBarController?.navigationItem.title = "Home"
        
        loadYoutube(videoID: "VMl9qAVknE4")
    }
    
    func loadYoutube(videoID: String) {
        guard
            let youtubeurl = URL(string: "https://youtube.com/embed/\(videoID)")
        else {return}
        welcomeVideo.load(URLRequest(url: youtubeurl))
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
    
}
    
    
    //MARK: - View Extensions
    

extension UIViewController {
    
    @objc func logoutPressed(sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            print("Logout successful")
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    func homeAlert() {
        
        let homeAlert = UIAlertController(title: "Home?", message: "Are you sure you wish to go back to the Home page? If you haven't sent your referral yet, you'll lose everything you've entered so far.", preferredStyle: UIAlertController.Style.alert)
        
        homeAlert.addAction(UIAlertAction(title: "Go Home", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: K.segues.homeSegue, sender: self)
        }))
        
        homeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            homeAlert.dismiss(animated: true)
        }))
        
        present(homeAlert, animated: true, completion: nil)
    }
    
    @objc func cHomeAlert() {
            
            let homeAlert = UIAlertController(title: "Home?", message: "Are you sure you wish to go back to the Home page? If you haven't sent your referral yet, you'll lose everything you've entered so far.", preferredStyle: UIAlertController.Style.alert)
            
            homeAlert.addAction(UIAlertAction(title: "Go Home", style: .default, handler: { (action: UIAlertAction!) in
                self.performSegue(withIdentifier: "unwindToHome", sender: self)
            }))
            
            homeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                homeAlert.dismiss(animated: true)
            }))
            
            present(homeAlert, animated: true, completion: nil)
    }
}
