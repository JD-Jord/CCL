//
//  AdditionalViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 21/07/2022.
//

import Foundation
import UIKit

class AdditionalViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var summaryField: UITextField!
    @IBOutlet weak var summaryWarning: UILabel!
    @IBOutlet weak var riskField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        summaryField.delegate = self
        riskField.delegate = self
        
        summaryWarning.alpha = 0
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if summaryField.text == "" {
            summaryWarning.alpha = 1
        } else {
            summaryWarning.alpha = 0
        }
        
        if summaryField.text != "" {
            ReferralForm.referral.summaryDetails = "Summary: \(summaryField.text ?? "")"
            ReferralForm.referral.riskDetails = "Any Risks: \(riskField.text ?? "None")"
            self.performSegue(withIdentifier: K.segues.finalSegue, sender: self)
        }
        
    }
    
}


extension AdditionalViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == summaryField {
            riskField.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
        return true
    }
}
