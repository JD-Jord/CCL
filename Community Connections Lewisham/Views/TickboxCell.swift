//
//  TickboxCell.swift
//  Community Connections Lewisham
//
//  Created by cex on 18/07/2022.
//

import UIKit

protocol TickboxCellDelegate: AnyObject {
    func buttonTapped(cell: TickboxCell)
}

class TickboxCell: UITableViewCell {
    
    @IBOutlet weak var supportBox: UIView!
    @IBOutlet weak var supportBtn: UIButton!
    @IBOutlet weak var checkmark: UIImageView!
    
    weak var delegate: TickboxCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    
    @IBAction func supportBtnTapped(_ sender: UIButton) {
        
        self.delegate?.buttonTapped(cell: self)
        
    }
}
