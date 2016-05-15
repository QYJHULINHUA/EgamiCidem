//
//  IHFRisReportView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/13.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisReportView: UIView {

    var reportImg :UIImageView!
    
//    var x:CGFloat{
//        get{
//            return self.frame.origin.x
//        }
//        set(newValue){
//            var frame = self.frame
//            frame.origin.x = newValue
//            self.frame = frame
//        }
//    }
    
    var hospitalsName:String
    {
        get{
            return self.hospitalsName
        }
        set(newString)
        {
            self.hospitalsName = newString
        }
    }
    
//    var hospitalsName :String!
//    var partName :String!
//    var reportStatus :String!
//    var modity :String!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.grayColor()
        
        reportImg = UIImageView.init(frame: CGRectMake(10, 10, 100, 100))
        reportImg.backgroundColor = UIColor.redColor()
        self.addSubview(reportImg)
        
        
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
