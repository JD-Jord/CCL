//
//  RegisterViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 04/07/2022.
//

import UIKit
import FirebaseAuth


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: K.Colours.navy)
        
    }
    
    func showEmailAlert() {
        let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    func showPasswordAlert() {
        let alert = UIAlertController(title: "Invalid Password", message: "Password must be at least 6 characters long, with one number and one uppercase letter", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    func showRegisterAlert() {
        let alert = UIAlertController(title: "Invalid Email", message: "Email address in use, please try again", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email.isValidEmail() {
                if password.isValidPassword() {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if error != nil {
                            self.showRegisterAlert()
                        } else {
                            self.performSegue(withIdentifier: K.segues.homeSegue, sender: self)
                        }
                    }
                    
                } else {
                    showPasswordAlert()
                }
            } else {
                self.showEmailAlert()
            }
        }
    }
}


extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,3})$", options: .caseInsensitive)
        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        print("Email validation \(valid)")
        return valid
    }
    
    func isValidPassword() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{6,}$")
        let valid = regex.evaluate(with: self)
        return valid
    }

}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
        } else {
            registerPressed(registerButton)
        }
        return true
    }
}


extension UIViewController {
    func hideKeyboardOnTaps() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
