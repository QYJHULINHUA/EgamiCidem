//
//  IHFRisRightView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/11.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisRightView: UIView {
    
    weak var fatherVC :IHFRisViewController?
    var topBar: IHFRisRightTopBar?
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        topBar = IHFRisRightTopBar.init(frame: CGRectMake(0, 0, 0.67 * screen_width, 50));
        self.addSubview(topBar!)
        
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


class IHFRisRightTopBar: UIView {
    
    let centerLabel = UILabel()
    
    //    weak var delegate:IHFLoginViewDelegate? //代理
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1)
        
        centerLabel.frame = frame;
        centerLabel.text = "请叫我胡大厨";
        centerLabel.textColor = UIColor.whiteColor();
        centerLabel.textAlignment = NSTextAlignment.Center;
        self.addSubview(centerLabel)
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

