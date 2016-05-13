//
//  IHFPatientListCell.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/13.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFPatientListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    let cellWidth = 0.33 * screen_width;
    let patient_Name = UILabel()
    let patient_ID = UILabel()
    let patient_checkDate = UILabel()
    let patient_modality = UILabel()
    let patient_seriesInfo = UILabel()
    let patient_barthDate = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let vv = UIView.init(frame: self.frame)
        vv.backgroundColor = UIColor.init(red: 87/255.0, green: 157/255.0, blue: 170/255.0, alpha: 1)
        self.selectedBackgroundView = vv
        
        self.backgroundColor = UIColor.init(red: 10/255.0, green: 10/255.0, blue: 10/255.0, alpha: 1)
        patient_Name.frame = CGRectMake(10, 5, 160, 18)
        patient_Name.textColor = UIColor.init(white: 1, alpha: 0.8)
        patient_Name.font = UIFont.systemFontOfSize(14.0)
        self.addSubview(patient_Name)
        
        patient_ID.frame = CGRectMake(10, 25, 160, 18)
        patient_ID.textColor = UIColor.init(white: 1, alpha: 0.8)
        patient_ID.font = UIFont.systemFontOfSize(14.0)
        self.addSubview(patient_ID)
        
        patient_checkDate.frame = CGRectMake(10, 45, 160, 18)
        patient_checkDate.textColor = UIColor.init(white: 1, alpha: 0.8)
        patient_checkDate.font = UIFont.systemFontOfSize(14.0)
        self.addSubview(patient_checkDate)
        
        patient_modality.frame = CGRectMake(cellWidth - 180.0, 5.0, 160, 18)
        patient_modality.textAlignment = NSTextAlignment.Right
        patient_modality.textColor = UIColor.init(white: 1, alpha: 0.8)
        patient_modality.font = UIFont.systemFontOfSize(14.0)
        self.addSubview(patient_modality)
        
        patient_seriesInfo.frame = CGRectMake(cellWidth - 180.0, 25.0, 160, 18)
        patient_seriesInfo.textAlignment = NSTextAlignment.Right
        patient_seriesInfo.textColor = UIColor.init(white: 1, alpha: 0.8)
        patient_seriesInfo.font = UIFont.systemFontOfSize(14.0)
        self.addSubview(patient_seriesInfo)
        
        patient_barthDate.frame = CGRectMake(cellWidth - 180.0, 45.0, 160, 18)
        patient_barthDate.textAlignment = NSTextAlignment.Right
        patient_barthDate.textColor = UIColor.init(white: 1, alpha: 0.8)
        patient_barthDate.font = UIFont.systemFontOfSize(14.0)
        self.addSubview(patient_barthDate)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
