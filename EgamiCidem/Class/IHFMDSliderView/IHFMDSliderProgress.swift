//
//  IHFMDSliderProgress.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/31.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMDSliderProgress: UIView {
    
    private var progressView: UIProgressView!
    private var progressView_length:CGFloat = 0.0
    private var centerView: UIImageView!
    
    private var markValue:Float = -1;
    private var point_width_2:CGFloat!
    private var point_x_max:CGFloat!;
    var pictureTotalNum = 0;
    var currentNum = 0;
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        let  point_width = self.frame.size.height;
        progressView_length = frame.size.width - point_width;
        point_width_2 = point_width/2;
        point_x_max = progressView_length + point_width_2;
        
        progressView = UIProgressView.init(frame: CGRectMake(point_width_2, frame.size.height * 0.5 - 1, progressView_length, 2));
        progressView.progress = 0;
        progressView.progressTintColor = UIColor.init(red: 98.0/255.0, green: 167.0/255.0, blue: 217.0/255.0, alpha: 1);
        progressView.trackTintColor = UIColor.brownColor();
        self.addSubview(progressView);
        
        centerView = UIImageView.init(frame: CGRectMake(0, 0, point_width, point_width))
        self.addSubview(centerView);
        self.userInteractionEnabled = true;
        centerView.userInteractionEnabled = true;
        centerView.center = CGPointMake(point_width_2, progressView.frame.origin.y )
        centerView.image = UIImage.init(named: "controlPoint");
        centerView.contentMode = .Center;
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(IHFMDSliderProgress.pointPanLocation(_:)))
        centerView.addGestureRecognizer(pan)
        
    }
    
    func pointPanLocation(panG:UIPanGestureRecognizer){
        var point = panG.locationInView(self.progressView)
        if point.x < point_width_2 {
            point.x = point_width_2;
        }
        if point.x > point_x_max {
            point.x = point_x_max;
        }
        centerView.center.x = point.x;
        
        let value = Float((point.x - point_width_2) / progressView_length);
        progressView.progress = value;
        
        
        if panG.state == .Changed
        {
            
            if markValue == value {
                return
            }else
            {
                print(value)
                markValue = value;
            }
            
        }else if panG.state == .Ended
        {
            
        }
        
    }
    
    func sliderSetPictureTotalNumAndCurrentNum(totalNum num1:Int?,currentNum num2:Int?)  {
        if num1 != nil {
            pictureTotalNum = num1!;
        }
        if num2 != nil {
            currentNum = num2!;
        }
        if pictureTotalNum == 0 {
            currentNum = 0;
            progressView.progress = 0;
            centerView.center.x = point_width_2;
        }else
        {
            let value = Float(currentNum)/Float(pictureTotalNum);
            progressView.progress = value;
            centerView.center.x = point_width_2 + (CGFloat(value) * progressView_length);
        }
        
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
