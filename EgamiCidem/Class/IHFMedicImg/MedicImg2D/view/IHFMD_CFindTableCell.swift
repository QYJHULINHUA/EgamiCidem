//
//  IHFMD_CFindTableCell.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/30.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMD_CFindTableCell: UITableViewCell {

    @IBOutlet weak var patientID: UILabel!
    
    @IBOutlet weak var studiID: UILabel!
    
    @IBOutlet weak var seriesID: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None;
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
