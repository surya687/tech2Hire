//
//  AtmCell.swift
//  ATMInformation2
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit

class AtmCell: UITableViewCell {

    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var workingStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
