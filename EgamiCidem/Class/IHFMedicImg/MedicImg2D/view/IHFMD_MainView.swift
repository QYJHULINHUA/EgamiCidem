//
//  IHFMD_MainView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/18.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMD_MainView: UIView,IHFMD_2D_BaseViewButtonDelegate {
    
    var baseViewArray:NSMutableArray!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        let baseView = IHFMD_2D_BaseView.getInstance(.IHFMD_2D_BaseView_All, size: frame);
        baseView.delegate = self;
        self.addSubview(baseView)
        baseViewArray = NSMutableArray.init(object: baseView);
        self.baseViewBtnShowControll();
    }
    
    func clickBaseViewButton(btnTag: Int, baseView: IHFMD_2D_BaseView) // 点击添加按钮
    {
        switch btnTag {
        case 1:
            print("点击删除")
        case 2: break
        
        case 3:
            self.addBaseView(baseView);
        case 4: break
            
        case 5: break
            
        default:
            break
        }
        
        self.baseViewBtnShowControll();
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
