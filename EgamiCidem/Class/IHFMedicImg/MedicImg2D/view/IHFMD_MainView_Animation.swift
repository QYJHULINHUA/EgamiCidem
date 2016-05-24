//
//  IHFMD_MainView_Animation.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/23.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import Foundation

extension IHFMD_MainView
{
    // 控制四个按钮的状态
    func baseViewBtnShowControll() {
        switch self.baseViewArray.count {
        case 1:
            
            let baseV = self.baseViewArray[0] as! IHFMD_2D_BaseView;
            baseV.deleBtn.enabled = false;
            baseV.linkBtn.enabled = false;
            baseV.addBtn.enabled  = true;
            baseV.fullBtn.enabled = false;
            
        case 2 , 3:
            for item in self.baseViewArray {
                let baseV = item as! IHFMD_2D_BaseView;
                baseV.deleBtn.enabled = true;
                baseV.linkBtn.enabled = true;
                baseV.addBtn.enabled  = true;
                baseV.fullBtn.enabled = true;
            }
            
        case 4:
            for item in self.baseViewArray {
                let baseV = item as! IHFMD_2D_BaseView;
                baseV.deleBtn.enabled = true;
                baseV.linkBtn.enabled = true;
                baseV.addBtn.enabled  = false;
                baseV.fullBtn.enabled = true;
            }
            
        default:
            break;
        }
    }
    
    // 点击添加baseview
    func addBaseView(baseView: IHFMD_2D_BaseView) {
        
        if baseView.windowType! == .IHFMD_2D_BaseView_All {
            
            self.creatAddView(baseView, windowType: .IHFMD_2D_BaseView_Long);
            
        }
        
        else if baseView.windowType! == .IHFMD_2D_BaseView_Long{
            
            self.creatAddView(baseView, windowType: .IHFMD_2D_BaseView_Small);
        }
        
        else if baseView.windowType! == .IHFMD_2D_BaseView_Small{
            
            for item in self.baseViewArray {
                let baseViewOther = item as! IHFMD_2D_BaseView;
                if baseViewOther.windowType! == .IHFMD_2D_BaseView_Long {
                    
                    self.creatAddView(baseViewOther, windowType: .IHFMD_2D_BaseView_Small);
                }
            }
            
            
        }
        
    }
    
    
    func creatAddView(baseView: IHFMD_2D_BaseView,windowType:IHFMD_2D_BaseViewType)  {
        
        let addView = IHFMD_2D_BaseView.getInstance(windowType, size: baseView.frame)
        addView.delegate = self;
        addView.alpha = 0.0;
        self.addSubview(addView);
        self.baseViewArray.addObject(addView)
        
        var changeSize = baseView.frame;
        if windowType == .IHFMD_2D_BaseView_Long  {
            changeSize.size.width = 0.5 * baseView.frame.size.width;
        }else
        {
        
            changeSize.size.height = 0.5 * baseView.frame.size.height;
        }
        UIView.animateWithDuration(0.5, animations: {
            
            baseView.frame = changeSize;
            baseView.refreshButtonFrame()
            baseView.windowType = windowType;
            addView.alpha = 1.0;
            
            }, completion: { (finished) in
                self.userInteractionEnabled = true;
        })
    }
    
}






