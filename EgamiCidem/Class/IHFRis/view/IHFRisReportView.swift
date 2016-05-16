//
//  IHFRisReportView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/13.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisReportView: UIView {

    var doctor :UILabel!
    var part :UILabel!
    var reportStatus :UILabel!
    var modity :UILabel!
    
    
    var hospitalsName:String
    {
        get{
            return self.hospitalsName
        }
        set(newString)
        {
            doctor.text = "医院  " + newString
            self.hospitalsName = newString
        }
    }
    
    var partName:String
    {
        get{
            return self.hospitalsName
        }
        set(newString)
        {
            part.text = "部位" + newString
            self.partName = newString
        }
    }
    

    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        let reportImg = UIImageView.init(frame: CGRectMake(10, 10, 100, 100))
        reportImg.image = UIImage.init(named: "IHFSearchReport")
        self.addSubview(reportImg)
        
        doctor = UILabel.init(frame: CGRectMake(130.0, 60.0, 200.0, 20.0))
        doctor.text = "医院  "
        doctor.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(doctor)
        
        reportStatus = UILabel.init(frame: CGRectMake(frame.size.width - 220.0, 60.0, 200.0, 20.0))
        reportStatus.text = "已检查"
        reportStatus.textAlignment = NSTextAlignment.Right
        reportStatus.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(reportStatus)
        
        part = UILabel.init(frame: CGRectMake(130.0, 90.0, 200.0, 20.0))
        part.text = "部位  "
        part.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(part)
        
        modity = UILabel.init(frame: CGRectMake(frame.size.width - 220.0, 90.0, 200.0, 20.0))
        modity.text = "CT"
        modity.textAlignment = NSTextAlignment.Right
        modity.textColor = UIColor.init(white: 1, alpha: 0.8)
        self.addSubview(modity)
        
        
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
