//
//  IHFMD_2D_BaseView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/19.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

enum IHFMD_2D_BaseViewType {
    case IHFMD_2D_BaseView_All
    case IHFMD_2D_BaseView_Long
    case IHFMD_2D_BaseView_Small
}


class IHFMD_2D_BaseView: UIView {
    
    var windowType :IHFMD_2D_BaseViewType!
    
    class func getInstance(type :IHFMD_2D_BaseViewType,size :CGRect)->IHFMD_2D_BaseView
    {
        let tempSize = IHFMD_2D_BaseView.getBaseViewSize(type, size: size);
        
        let baseView = IHFMD_2D_BaseView.init(frame: tempSize);
        baseView.backgroundColor = UIColor.blackColor();
        baseView.layer.borderWidth = 1.0;
        baseView.layer.borderColor = UIColor.init(red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1).CGColor;
        baseView.windowType = type;
        return baseView;
    }

    
    class func getBaseViewSize(type:IHFMD_2D_BaseViewType,size:CGRect)->CGRect
    {
        let W = size.width;
        let h = size.height;
        var baseSize = CGRectMake(0, 0, W, h);
        
        switch type {
        case .IHFMD_2D_BaseView_All:
            break ;
            
        case .IHFMD_2D_BaseView_Long:
            baseSize.size.width = 0.5 * W;
            
        case .IHFMD_2D_BaseView_Small:
            baseSize.size.width = 0.5 * W;
            baseSize.size.height = 0.5 * h;
        }
        
        return baseSize;
    }
    
}
