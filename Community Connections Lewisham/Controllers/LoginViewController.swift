//
//  LoginViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 04/07/2022.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: K.Colours.cyan)
    }
    
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil  {
                    let alert = UIAlertController(title: "Invalid email or password", message: "Email address or password incorrect", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))

                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    self.performSegue(withIdentifier: K.segues.homeSegue, sender: self)
                }
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
        } else {
            loginPressed(loginButton!)
        }
        return true
    }
}
