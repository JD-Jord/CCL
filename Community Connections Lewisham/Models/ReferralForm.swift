//
//  ReferralForm.swift
//  Community Connections Lewisham
//
//  Created by cex on 28/07/2022.
//

import Foundation


struct ReferralForm {
    static var referral: ReferralForm = ReferralForm()
    
    var referrerName: String = "No Referrer name"
    var referrerNumber: String = "No Referrer number"
    var referrerEmail: String = "No Referrer email"
    var referrerOrg: String = "No Referrer organisation"
    
    var clientName: String = ""
    var clientDOB: String = ""
    var clientGender: String = ""
    var clientEthnicity: String = ""
    
    var clientAddressLine1: String = ""
    var clientAddressLine2: String = ""
    var clientAddressLine3: String = ""
    var clientAddressLine4: String = ""
    var clientAddressLine5: String = ""
    var clientPostcode: String = ""
    var clientMainNumber: String = ""
    var clientOtherNumber: String = ""
    var clientEmail: String = ""
    var clientGP: String = ""
    var clientMethod: String = ""
    
    var nokName: String = ""
    var nokNumber: String = ""
    var nokEmail: String = ""
    var nokRelation: String = ""
    
    var healthSupport: [String] = []
    var socialSupport: [String] = []
    var financesSupport: [String] = []
    var safetySupport: [String] = []
    var learningSupport: [String] = []
    var housingSupport: [String] = []
    var specialSupport: [String] = []
    
    var summaryDetails: String = ""
    var riskDetails: String = "No risk details given"
    
    var consent: String = ""
    var hearAboutUs: String = ""
    
}

extension ReferralForm: CustomStringConvertible {
    var description: String {
        return "\(referrerName) \n\(referrerNumber) \n\(referrerEmail) \n\(referrerOrg)\n \n\(clientName)\n\(clientDOB)\n\(clientGender)\n\(clientEthnicity)\n \n\(clientAddressLine1)\n\(clientAddressLine2)\n\(clientAddressLine3)\n\(clientAddressLine4)\n\(clientAddressLine5)\n\(clientPostcode)\n \n\(clientMainNumber)\n\(clientOtherNumber)\n\(clientEmail)\n\(clientGP)\n\(clientMethod)\n \n\(nokName)\n\(nokNumber)\n\(nokEmail)\n\(nokRelation)\n \nHealth Support \n\(healthSupport)\nSocial Support \n\(socialSupport)\nFinancial Support \n\(financesSupport)\nSafety Support \n\(safetySupport)\nLearning Support \n\(learningSupport)\nHousing Support \n\(housingSupport)\nSpecial Support \n\(specialSupport)\n \n\(summaryDetails)\n\(riskDetails)\n \n\(consent)\n\(hearAboutUs)"
    }
}
