//
//  IHFMD_MainView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/18.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMD_MainView: UIView {
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        let baseView = IHFMD_2D_BaseView.getInstance(.IHFMD_2D_BaseView_All, size: frame);
        self.addSubview(baseView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
