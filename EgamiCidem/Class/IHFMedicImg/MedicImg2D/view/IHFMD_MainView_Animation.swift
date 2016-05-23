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
    
    func addBaseView(baseView: IHFMD_2D_BaseView) {
        
        if baseView.windowType! == .IHFMD_2D_BaseView_All {
            
            let addView = IHFMD_2D_BaseView.getInstance(.IHFMD_2D_BaseView_Long, size:baseView.frame);
            addView.delegate = self;
            addView.frame = CGRectMake(baseView.frame.size.width * 0.5, 0, addView.frame.size.width, addView.frame.size.height);
            addView.alpha = 0.0;
            self.addSubview(addView);
            self.baseViewArray.addObject(addView)
            
            let changeSize = IHFMD_2D_BaseView.getBaseViewSize(.IHFMD_2D_BaseView_Long, size: baseView.frame);
            UIView.animateWithDuration(0.5, animations: {
                
                baseView.frame = changeSize;
                baseView.refreshButtonFrame()
                addView.alpha = 1.0;
                
                }, completion: { (finished) in
                    self.userInteractionEnabled = true;
            })
            
        }
        
        if baseView {
            <#code#>
        }
        
        
        
    }
}