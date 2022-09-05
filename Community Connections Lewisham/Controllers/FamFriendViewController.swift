//
//  FamFriendViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 29/07/2022.
//

import Foundation
import UIKit

class FamFriendViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameWarning: UILabel!
    @IBOutlet weak var relationshipField: UITextField!
    @IBOutlet weak var relationshipWarning: UILabel!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var contactWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        nameWarning.alpha = 0
        relationshipWarning.alpha = 0
        contactWarning.alpha = 0
        
        nameField.delegate = self
        relationshipField.delegate = self
        numberField.delegate = self
        emailField.delegate = self
        
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if nameField.text == "" {
            nameWarning.alpha = 1
        } else {
            nameWarning.alpha = 0
        }
        
        if relationshipField.text == "" {
            relationshipWarning.alpha = 1
        } else {
            relationshipWarning.alpha = 0
        }
        
        if numberField.text == "" && emailField.text == "" {
            contactWarning.alpha = 1
        } else {
            contactWarning.alpha = 0
        }
        
        if nameField.text != "" && relationshipField.text != "" && contactWarning.alpha == 0 {
            ReferralForm.referral.nokName = "Next of Kin Name: \(nameField.text ?? "")"
            ReferralForm.referral.nokRelation = "Next of Kin Relationship: \(relationshipField.text ?? "")"
            ReferralForm.referral.nokNumber = "Next of Kin Number: \(numberField.text ?? "")"
            ReferralForm.referral.nokEmail = "Next of Kin Email: \(emailField.text ?? "")"
            self.performSegue(withIdentifier: K.segues.personalSegue, sender: self)
        }
        
    }
    
    
}


//MARK: - extensions

extension FamFriendViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            relationshipField.becomeFirstResponder()
        } else if textField == relationshipField {
            numberField.becomeFirstResponder()
        } else if textField == numberField {
            emailField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
