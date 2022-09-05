//
//  FinalViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 21/07/2022.
//

import Foundation
import UIKit
import MessageUI

class FinalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var consentField: UITextField!
    @IBOutlet weak var consentWarning: UILabel!
    @IBOutlet weak var hearAboutUsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        consentPickerView.delegate = self
        consentPickerView.dataSource = self
        hearAboutUsPickerView.delegate = self
        hearAboutUsPickerView.dataSource = self
        
        consentField.inputView = consentPickerView
        hearAboutUsField.inputView = hearAboutUsPickerView
        
        consentField.delegate = self
        hearAboutUsField.delegate = self
        
        consentWarning.alpha = 0
    }
    
    //MARK: - Pickers
    
    let consentPickerView = UIPickerView()
    
    let hearAboutUsPickerView = UIPickerView()
    
    var selectedConsent: String?
    var consentList = ["No", "Yes"]
    
    var selectedHearAboutUs: String?
    var hearAboutUsList = ["Through My GP", "At the Hospital", "Through Lewisham Council / Adult Social Care", "Through a Family Member / Friend", "Online", "On Social Media", "Through a Voluntary Sector Group or Organisation", "Other"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == consentPickerView {
            return consentList.count
        } else if pickerView == hearAboutUsPickerView {
            return hearAboutUsList.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == consentPickerView {
            return consentList[row]
        } else if pickerView == hearAboutUsPickerView {
            return hearAboutUsList[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == consentPickerView {
            consentField.text = consentList[row]
            self.view.endEditing(false)
        } else if pickerView == hearAboutUsPickerView {
            hearAboutUsField.text = hearAboutUsList[row]
            self.view.endEditing(false)
        }
    }
    
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if consentField.text == "" || consentField.text == "No" {
            consentWarning.alpha = 1
        } else {
            consentWarning.alpha = 0
        }
        if consentField.text == "Yes" {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["jordan_oshea@hotmail.co.uk"])
                mail.setSubject("New Community Connections Lewisham App Referral")
                mail.setMessageBody("\(ReferralForm.referral)", isHTML: false)
                
                present(mail, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Unable to send referral", message: "It looks like you might not have configured Mail for iPhone. Please ensure your Mail app is set up, or call the CCL office on 0330 058 3464 ", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
            ReferralForm.referral = ReferralForm()
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        case .saved:
            print("saved")
        case .sent:
            print("Email sent")
        @unknown default:
            print("default")
        }
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func homePressed(_ sender: UIButton) {
        cHomeAlert()
    }

}

//MARK: - extensions

extension FinalViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == consentField {
            hearAboutUsField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
