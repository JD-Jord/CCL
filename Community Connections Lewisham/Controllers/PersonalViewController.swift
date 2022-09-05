//
//  SecondProfRefViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 15/07/2022.
//

import Foundation
import UIKit


class PersonalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var ethnicityField: UITextField!
    @IBOutlet weak var nameWarning: UILabel!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var dobWarning: UILabel!
    @IBOutlet weak var genderWarning: UILabel!
    @IBOutlet weak var ethnicityWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        ethnicityPickerView.delegate = self
        ethnicityPickerView.dataSource = self
        
        genderField.inputView = genderPickerView
        ethnicityField.inputView = ethnicityPickerView
        
        nameField.delegate = self
        dayField.delegate = self
        monthField.delegate = self
        yearField.delegate = self
        
        nameWarning.alpha = 0
        dobWarning.alpha = 0
        genderWarning.alpha = 0
        ethnicityWarning.alpha = 0
        
    }
    
    
    
    //MARK: - Pickers
    
    let genderPickerView = UIPickerView()
    
    let ethnicityPickerView = UIPickerView()
    
    var selectedGender: String?
    var genderList = ["Male", "Female", "Non-Binary", "Do Not Wish to Disclose"]
    
    var selectedEthnicity: String?
    var ethnicityList = ["Arab", "Asian or Asian British - Bangladeshi", "Asian or Asian British - Chinese", "Asian or Asian British - Indian", "Asian or Asian British - Pakistani", "Asian or Asian British - Other Asian Background", "Black or Black British - African", "Black or Black British - Caribbean", "Black or Black British - Other Black Background", "Latin American", "Mixed - White and Asian", "Mixed - White and Black African", "Mixed - White and Black African", "Mixed - Other Mixed Background", "White - British", "White - Other White Background", "Other - Other Ethnic Background", "Prefer Not To Say", "Not Known/Not Stated"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPickerView {
            return genderList.count
        } else if pickerView == ethnicityPickerView {
            return ethnicityList.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPickerView {
            return genderList[row]
        } else if pickerView == ethnicityPickerView {
            return ethnicityList[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderPickerView {
            genderField.text = genderList[row]
            self.view.endEditing(false)
        } else if pickerView == ethnicityPickerView {
            ethnicityField.text = ethnicityList[row]
            self.view.endEditing(false)
        }
    }
    
    //MARK: - date restrictions
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength = 100
        if textField == dayField || textField == monthField {
            maxLength = 2
        } else if textField == yearField {
            maxLength = 4
        }
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
    
    
    
    
    
    //MARK: - next
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if nameField.text == "" {
            nameWarning.alpha = 1
        } else {
            nameWarning.alpha = 0
        }
        
        if dayField.text == "" || monthField.text == "" || yearField.text == "" {
            dobWarning.alpha = 1
        } else {
            dobWarning.alpha = 0
        }
        
        if genderField.text == "" {
            genderWarning.alpha = 1
        } else {
            genderWarning.alpha = 0
        }
        
        if ethnicityField.text == "" {
            ethnicityWarning.alpha = 1
        } else {
            ethnicityWarning.alpha = 0
        }
        
        
        
        if nameField.text != "" && dayField.text != "" && monthField.text != "" && yearField.text != "" && genderField.text != "" && ethnicityField.text != "" {
            ReferralForm.referral.clientName = "Client Name: \(nameField.text ?? "")"
            ReferralForm.referral.clientDOB = "Client Date of Birth: \(dayField.text ?? "")/\(monthField.text ?? "")/\(yearField.text ?? "")"
            ReferralForm.referral.clientGender = "Client Gender: \(genderField.text ?? "")"
            ReferralForm.referral.clientEthnicity = "Client Ethnicity: \(ethnicityField.text ?? "")"
            self.performSegue(withIdentifier: K.segues.contactSegue, sender: self)
        } else {
            print("???")
        }
        
    }
    
}
//MARK: - extensions

extension PersonalViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            dayField.becomeFirstResponder()
        } else if textField == dayField {
            monthField.becomeFirstResponder()
        } else if textField == monthField {
            yearField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
