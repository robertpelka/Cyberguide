//
//  AdviceCell.swift
//  Cyberguide
//
//  Created by Robert Pelka on 13/12/2020.
//

import UIKit

class AdviceCell: UITableViewCell {

    @IBOutlet weak var adviceText: UILabel!
    @IBOutlet weak var votes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
