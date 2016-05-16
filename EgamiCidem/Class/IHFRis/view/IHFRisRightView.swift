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
    var topBar: IHFRisRightTopBar!
    var reportView: IHFRisReportView!
    var seriesListView: IHFRisSeriesListView!
    
    let R_width = 0.67 * screen_width
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        topBar = IHFRisRightTopBar.init(frame: CGRectMake(0, 0, R_width, 50));
        self.addSubview(topBar!)
        
        let reportTilte = IHFRisRightTitleBar.init(frame: CGRectMake(0, 50, R_width, 35))
        self.addSubview(reportTilte)
        reportTilte.centerLabel.text = "报告"
        
        reportView = IHFRisReportView.init(frame:CGRectMake(0, 85, R_width, 120))
        self.addSubview(reportView!)
        
        let xilieTitle = IHFRisRightTitleBar.init(frame: CGRectMake(0, 205, R_width, 35))
        self.addSubview(xilieTitle)
        xilieTitle.centerLabel.text = "系列"
        
        seriesListView = IHFRisSeriesListView.init(frame: CGRectMake(0, 240.0, R_width, screen_height - 240.0))
        self.addSubview(seriesListView)
        
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
        self.backgroundColor = UIColor.init(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)
        
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

class IHFRisRightTitleBar: UIView {
    
    let centerLabel = UILabel()
    
    //    weak var delegate:IHFLoginViewDelegate? //代理
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1)
        var a = frame
        a.origin.y = 0
        centerLabel.frame = a
        centerLabel.textColor = UIColor.init(white: 0.8, alpha: 0.8);
        centerLabel.textAlignment = NSTextAlignment.Left;
        self.addSubview(centerLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

