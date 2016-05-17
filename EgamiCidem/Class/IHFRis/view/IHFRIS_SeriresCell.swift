//
//  IHFRIS_SeriresCell.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/17.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRIS_SeriresCell: UITableViewCell {
    
    var Thumbnail = UIImageView() //  缩略图
    var date = UILabel()
    var modility = UILabel()
    var imageNumble = UILabel()
    var hospitalName = UILabel()
    let self_width = 0.67 * screen_width
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.init(red: 10/255.0, green: 10/255.0, blue: 10/255.0, alpha: 1)
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        
        Thumbnail.frame = CGRectMake(10, 10, 100, 100)
        self.addSubview(Thumbnail)
        Thumbnail.image = UIImage.init(named: "Thumbnail.jpg")

        date.frame = CGRectMake(130.0, 60.0, 200.0, 20.0)
        date.text = "时间  "
        date.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(date)
        
        modility.frame = CGRectMake(self_width - 220.0, 60.0, 200.0, 20.0)
        modility.textAlignment = NSTextAlignment.Right
        modility.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(modility)
        
        hospitalName.frame = CGRectMake(130.0, 90.0, 200.0, 20.0)
        hospitalName.text = "医院  "
        hospitalName.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(hospitalName)
        
        imageNumble.frame = CGRectMake(self_width - 220.0, 90.0, 200.0, 20.0)
        imageNumble.textAlignment = NSTextAlignment.Right
        imageNumble.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(imageNumble)
        
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
