//
//  SocialViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 19/07/2022.
//

import Foundation
import UIKit

class SocialViewController: UIViewController, TickboxCellDelegate {
    
    var ticks: [String:String] = [:]
    
    func buttonTapped(cell: TickboxCell) {
        
        if cell.supportBtn.isSelected == false {
            if let title = cell.supportBtn.titleLabel?.text {
                ticks.updateValue("Yes", forKey: title)
            }
            cell.supportBtn.isSelected = true
            cell.checkmark.image = UIImage(named: K.Images.checked)
        } else {
            if let title = cell.supportBtn.titleLabel?.text {
                ticks.removeValue(forKey: title)
                cell.supportBtn.isSelected = false
                cell.checkmark.image = UIImage(named: K.Images.notChecked)
            }
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let support = ["Access to Transport Schemes (e.g., Taxicard, Dial-A-Ride etc.",
                   "Befriending",
                   "Help with IT / Accessing the Internet",
                   "Meeting New People / Looking for Social Groups"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        print(ticks)
        ReferralForm.referral.socialSupport = Array(ticks.keys)
        self.performSegue(withIdentifier: K.segues.financesSegue, sender: self)
    }
    
}

extension SocialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return support.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newSupport = support[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TickboxCell
        cell.delegate = self
        cell.supportBtn.setTitle(newSupport, for: .normal)
        return cell
    }

}
