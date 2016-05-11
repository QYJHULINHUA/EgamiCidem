//
//  IHFRisLeftView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/11.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisLeftView: UIView {
    
    weak var fatherVC:IHFRisViewController?
    
    func FatherVC(fatherVC vc:IHFRisViewController,frame frame1:CGRect) -> (IHFRisLeftView)
    {
        let instance = IHFRisLeftView.init(frame: frame1)
        return instance;
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
        
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
