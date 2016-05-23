//
//  IHFM_VC_LeftToolBar.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/17.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFM_VC_LeftToolBar: UIView {
    
    let escBtn = UIButton()
    var nameTitle:UILabel!
    let fourInfoBtn = UIButton()
    
    private let btton_space:CGFloat = 12.0
    private let btton_width:CGFloat = 34.0
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 28/255.0, green: 28/255.0, blue: 28/255.0, alpha: 1)
        
        escBtn.frame = CGRectMake(btton_space, btton_space, btton_width, btton_width)
        escBtn.setImage(UIImage.init(named: "返回"), forState: UIControlState.Normal)
        self.addSubview(escBtn)
        
        fourInfoBtn.frame = CGRectMake(btton_space, screen_height - btton_space - btton_width, btton_width, btton_width)
        fourInfoBtn.setImage(UIImage.init(named: "显示隐藏"), forState: UIControlState.Normal)
        self.addSubview(fourInfoBtn)
        fourInfoBtn.selected = true
        
        nameTitle = UILabel.init(frame: CGRect(x: 50, y: 50, width: 200, height: 35))
        nameTitle.text = "HuXiaoMing"
        nameTitle.font = UIFont.init(name: "AmericanTypewriter", size: 19)
        nameTitle.textColor = UIColor.init(white: 0.7, alpha: 0.8)
        nameTitle.center = self.center;
        nameTitle.textAlignment = .Center;
        nameTitle.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI/2))
        self.addSubview(nameTitle)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
