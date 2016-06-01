//
//  IHFM_VC_RightToolBar.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/17.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFM_VC_RightToolBar: UIView {
    
    var slider : IHFMDSliderView!
    

    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 28/255.0, green: 28/255.0, blue: 28/255.0, alpha: 1)
        
        slider = IHFMDSliderView.init(frame: CGRectMake(0, 0.23 * frame.size.height, frame.size.width, 0.54 * frame.size.height))
        self.addSubview(slider)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
