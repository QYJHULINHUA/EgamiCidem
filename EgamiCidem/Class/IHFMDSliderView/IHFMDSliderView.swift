//
//  IHFMDSliderView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/31.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMDSliderView: UIView {
    
    private var btn1:UIButton! // 上面的播放按钮
    private var btn2:UIButton! // 下面的播放按钮
    private var slider : IHFMDSliderProgress!
    
    
    
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        let ww = frame.size.width;
        btn1 = UIButton.init(frame: CGRectMake(5, 5, ww - 10, ww - 10))
        self.addSubview(btn1);
        btn1.setImage(UIImage.init(named: "IHFPlay100"), forState: .Normal)
        btn1.setImage(UIImage.init(named: "IHFStop100"), forState: .Selected)
        btn1.addTarget(self, action: #selector(IHFMDSliderView.Btn1_touch), forControlEvents: .TouchUpInside);
        
        
        slider = IHFMDSliderProgress.init(frame:CGRectMake(0, 5,0.7 * frame.size.height,ww - 10));
        slider.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2));
        slider.center = CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height)
        self.addSubview(slider)
        
        
        btn2 = UIButton.init(frame: CGRectMake(5, frame.size.height - ww - 5, ww - 10, ww - 10))
        self.addSubview(btn2);
        btn2.setImage(UIImage.init(named: "IHFPlay200"), forState: .Normal)
        btn2.setImage(UIImage.init(named: "IHFStop200"), forState: .Selected)
        btn2.addTarget(self, action: #selector(IHFMDSliderView.Btn2_touch), forControlEvents: .TouchUpInside);
    }
    
    func setPictureTotalNumAndCurrentNum(totalNum num1:Int?,currentNum num2:Int?)  {
        slider.sliderSetPictureTotalNumAndCurrentNum(totalNum: num1, currentNum: num2);
    }
    
    func Btn1_touch() {
        btn1.selected = !btn1.selected;
    }
    
    func Btn2_touch() {
        btn2.selected = !btn2.selected;
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
