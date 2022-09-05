//
//  ThirdProfController.swift
//  Community Connections Lewisham
//
//  Created by cex on 17/07/2022.
//

import Foundation
import UIKit

class ContactViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var addressLine1: UITextField!
    @IBOutlet weak var addressLine2: UITextField!
    @IBOutlet weak var addressLine3: UITextField!
    @IBOutlet weak var addressLine4: UITextField!
    @IBOutlet weak var addressLine5: UITextField!
    @IBOutlet weak var postcodeField: UITextField!
    @IBOutlet weak var addressWarning: UILabel!
    @IBOutlet weak var postcodeWarning: UILabel!
    @IBOutlet weak var mainNumberField: UITextField!
    @IBOutlet weak var otherNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var contactWarning: UILabel!
    @IBOutlet weak var gpField: UITextField!
    @IBOutlet weak var gpWarning: UILabel!
    @IBOutlet weak var methodField: UITextField!
    @IBOutlet weak var methodWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        addressWarning.alpha = 0
        postcodeWarning.alpha = 0
        contactWarning.alpha = 0
        gpWarning.alpha = 0
        methodWarning.alpha = 0
        
        gpPickerView.delegate = self
        gpPickerView.dataSource = self
        methodPickerView.delegate = self
        methodPickerView.dataSource = self
        
        gpField.inputView = gpPickerView
        methodField.inputView = methodPickerView
        
        addressLine1.delegate = self
        addressLine2.delegate = self
        addressLine3.delegate = self
        addressLine4.delegate = self
        addressLine5.delegate = self
        postcodeField.delegate = self
        mainNumberField.delegate = self
        otherNumberField.delegate = self
        emailField.delegate = self
        gpField.delegate = self
        methodField.delegate = self
        
    }
    
    
    //MARK: - Pickers
    
    let gpPickerView = UIPickerView()
    let methodPickerView = UIPickerView()
    
    var selectedGP: String?
    var gpList = ["Amersham Vale",
                  "Baring Road Medical Centre",
                  "Bellingham Green Surgery",
                  "Belmont Hill Surgery",
                  "Boundfield Medical Centre",
                  "Brockley Road Surgery",
                  "Chinbrook Surgery",
                  "Clifton Rise",
                  "Deptford Medical Centre",
                  "Deptford Surgery",
                  "Downham Family Medical Practice",
                  "Elm Lodge Surgery Bromley",
                  "Hilly Fields Medical Centre",
                  "Honor Oak Group Practice",
                  "Hurley Group Practice",
                  "Kingfisher Medical Centre",
                  "Lee Road Surgery",
                  "Lewisham Medical",
                  "Marvels Lane Surgery",
                  "Moorside Clinic",
                  "Morden Hill Surgery",
                  "Mornington Surgery",
                  "Muirkirk Surgery",
                  "New Cross Health Centre",
                  "Nightingale Surgery",
                  "Nunhead Surgery",
                  "Oakview Family Practice",
                  "Old Kent Road Surgery",
                  "Parkview Surgery",
                  "Paxton Green Group Practice",
                  "Queens Road Partnership",
                  "Queens Road Surgery",
                  "Rushey Green Group Practice",
                  "South Lewisham Group Practice",
                  "St. Johns Medical Centre",
                  "Sydenham Green Surgery",
                  "The Grove Medical Centre",
                  "The Jenner Practice",
                  "The Vale Medical Centre",
                  "Torridon Road Medical Centre",
                  "Triangle Group Practice",
                  "Vesta Road Surgery",
                  "Waldron Health Centre",
                  "Wells Park Practice",
                  "Winlaton Surgery",
                  "Woodlands Health Centre",
                  "Woolstone Medical Centre",
                  "GP Surgery Not Listed / Out of Area"
    ]
    
    var selectedMethod: String?
    var methodList = ["Main Contact Number",
                      "Contact my Next of Kin",
                      "Mobile Number",
                      "Texts Only",
                      "Email Only",
                      "Letters Only"
    ]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == gpPickerView {
            return gpList.count
        } else if pickerView == methodPickerView {
            return methodList.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == gpPickerView {
            return gpList[row]
        } else if pickerView == methodPickerView {
            return methodList[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == gpPickerView {
            gpField.text = gpList[row]
            self.view.endEditing(false)
        } else if pickerView == methodPickerView {
            methodField.text = methodList[row]
            self.view.endEditing(false)
        }
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if addressLine1.text == "" {
            addressWarning.alpha = 1
        } else {
            addressWarning.alpha = 0
        }
        
        if postcodeField.text == "" {
            postcodeWarning.alpha = 1
        } else {
            postcodeWarning.alpha = 0
        }
        
        if mainNumberField.text == "" && otherNumberField.text == "" && emailField.text == "" {
            contactWarning.alpha = 1
        } else {
            contactWarning.alpha = 0
        }
        
        if gpField.text == "" {
            gpWarning.alpha = 1
        } else {
            gpWarning.alpha = 0
        }
        
        if methodField.text == "" {
            methodWarning.alpha = 1
        } else {
            methodWarning.alpha = 0
        }
        
        if addressLine1.text != "" && postcodeField.text != "" && contactWarning.alpha == 0 && gpField.text != "" && methodField.text != "" {
            ReferralForm.referral.clientAddressLine1 = "Client Address Line 1: \(addressLine1.text ?? "")"
            ReferralForm.referral.clientAddressLine2 = "Client Address Line 2: \(addressLine2.text ?? "")"
            ReferralForm.referral.clientAddressLine3 = "Client Address Line 3: \(addressLine3.text ?? "")"
            ReferralForm.referral.clientAddressLine4 = "Client Address Line 4: \(addressLine4.text ?? "")"
            ReferralForm.referral.clientAddressLine5 = "Client Address Line 5: \(addressLine5.text ?? "")"
            ReferralForm.referral.clientPostcode = "Client Postcode: \(postcodeField.text ?? "")"
            ReferralForm.referral.clientMainNumber = "Client Main Number: \(mainNumberField.text ?? "Not given")"
            ReferralForm.referral.clientOtherNumber = "Client Other Number: \(otherNumberField.text ?? "Not given")"
            ReferralForm.referral.clientEmail = "Client Email: \(emailField.text ?? "Not given")"
            ReferralForm.referral.clientGP = "Client GP Surgery: \(gpField.text ?? "")"
            ReferralForm.referral.clientMethod = "Client Method of Contact: \(methodField.text ?? "")"
            if methodField.text == "Contact my Next of Kin"  && ReferralForm.referral.nokName == "" {
                self.performSegue(withIdentifier: K.segues.nokSegue, sender: self)
            } else {
                self.performSegue(withIdentifier: K.segues.healthSegue, sender: self)
            }
        }
    }
}

//MARK: - extensions

extension ContactViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == addressLine1 {
            addressLine2.becomeFirstResponder()
        } else if textField == addressLine2 {
            addressLine3.becomeFirstResponder()
        } else if textField == addressLine3 {
            addressLine4.becomeFirstResponder()
        } else if textField == addressLine4 {
            addressLine5.becomeFirstResponder()
        } else if textField == addressLine5 {
            postcodeField.becomeFirstResponder()
        } else if textField == postcodeField {
            mainNumberField.becomeFirstResponder()
        } else if textField == mainNumberField {
            otherNumberField.becomeFirstResponder()
        } else if textField == otherNumberField {
            emailField.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
        return true
    }
}
