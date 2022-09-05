//
//  1stProfViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 11/07/2022.
//

import Foundation
import UIKit

class ProfViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var orgField: UITextField!
    
    @IBOutlet weak var nameWarning: UILabel!
    @IBOutlet weak var emailWarning: UILabel!
    @IBOutlet weak var orgWarning: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        nameField.delegate = self
        numberField.delegate = self
        emailField.delegate = self
        orgField.delegate = self
        
        nameWarning.alpha = 0
        emailWarning.alpha = 0
        orgWarning.alpha = 0
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
    }

    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        emailWarning.alpha = 0
        orgWarning.alpha = 0
        
        if nameField.text == "" {
            nameWarning.alpha = 1
        } else {
            nameWarning.alpha = 0
        }
        
        if emailField.text == "" {
            emailWarning.alpha = 1
        }
        
        if orgField.text == "" {
            orgWarning.alpha = 1
        }
        
        if nameField.text != "" && orgField.text != "" {
            if let email = emailField.text {
                if email.isValidEmail() {
                    ReferralForm.referral.referrerName = "Referrer Name: \(nameField.text ?? "No Refferer Name")"
                    ReferralForm.referral.referrerNumber = "Referrer Number: \(numberField.text ?? "No Referrer Number")"
                    ReferralForm.referral.referrerEmail = "Referrer Email: \(emailField.text ?? "No Referrer Email")"
                    ReferralForm.referral.referrerOrg = "Referrer Organisation: \(orgField.text ?? "No Referrer Organisation")"
                    self.performSegue(withIdentifier: K.segues.personalSegue, sender: self)
                } else {
                    print("error here")
                    emailWarning.alpha = 1
                }
            } else {
                print("error here2")
                emailWarning.alpha = 1
            }
        }
    }
}

extension ProfViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            numberField.becomeFirstResponder()
        } else if textField == numberField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            orgField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
