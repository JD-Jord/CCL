//
//  HealthViewController.swift
//  Community Connections Lewisham
//
//  Created by cex on 18/07/2022.
//

import Foundation
import UIKit

class HealthViewController: UIViewController, TickboxCellDelegate {
    
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
    
    
    let support = ["Alcohol or Substance Misuse",
                   "Discrimination Support (BAME, LGBTQ+ etc)",
                   "Exercise Groups, Classes and Walks",
                   "Help with Diet / Healthy Eating",
                   "Looking after your Mental Health",
                   "Stopping Smoking",
                   "Toenail Cutting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTaps()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cHomeAlert))
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }

    
    @IBAction func nextPressed(_ sender: UIButton) {
        print(ticks)
        ReferralForm.referral.healthSupport = Array(ticks.keys)
        self.performSegue(withIdentifier: K.segues.socialSegue, sender: self)
    }
    
    
}


extension HealthViewController: UITableViewDataSource {
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
