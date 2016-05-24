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
            baseV.linkBtn.selected = false;
            baseV.linkBtn.setImage(UIImage.init(named: "未联动"), forState: .Normal)
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
    
    func currentBaseViweShowDiffrent(){
        for item in self.baseViewArray {
            let aaa = item as! IHFMD_2D_BaseView;
            if aaa .isEqual(self.currentBaseView) {
                aaa.layer.borderColor = UIColor.init(red: 160.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1).CGColor;
            }
            else{
                aaa.layer.borderColor = UIColor.init(red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1).CGColor;
            }
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
    
    // baseview移除及其动画
    func removeBasevie(baseView: IHFMD_2D_BaseView) {
        let origin_x = baseView.frame.origin.x;
        self.baseViewArray.removeObject(baseView);
        
        if baseView.windowType! == .IHFMD_2D_BaseView_Small {
            
         baseView.removeFromSuperview()
            for item in self.baseViewArray {
                let baseOther = item as! IHFMD_2D_BaseView;
                
                if baseOther.frame.origin.x == origin_x {
                    
                    var baseOtherRect = baseOther.frame;
                    baseOtherRect.origin.x = origin_x;
                    baseOtherRect.origin.y = 0;
                    baseOtherRect.size.height = 2.0 * baseOtherRect.size.height;
                    
                    UIView.animateWithDuration(0.5, animations: {
                        
                        baseOther.frame = baseOtherRect;
                        baseOther.refreshButtonFrame()
                        baseOther.windowType = .IHFMD_2D_BaseView_Long;
                        
                        }, completion: { (finished) in
                            self.userInteractionEnabled = true;
                    })
                }
            }
        }
        
        else if baseView.windowType! == .IHFMD_2D_BaseView_Long
        {
            
             baseView.removeFromSuperview()
            if self.baseViewArray.count == 1
            {
                let baseOther = self.baseViewArray[0] as! IHFMD_2D_BaseView;
                var baseOtherRect = baseOther.frame;
                baseOtherRect.origin = CGPointMake(0, 0);
                baseOtherRect.size.width = 2.0 * baseOtherRect.size.width;
                
                UIView.animateWithDuration(0.5, animations: {
                    
                    baseOther.frame = baseOtherRect;
                    baseOther.refreshButtonFrame()
                    baseOther.windowType = .IHFMD_2D_BaseView_All;
                    
                    }, completion: { (finished) in
                        self.userInteractionEnabled = true;
                })
                
            }else if self.baseViewArray.count == 2
            {
                var base1:IHFMD_2D_BaseView?
                var base2:IHFMD_2D_BaseView?
                for item in self.baseViewArray {
                    let a = item as! IHFMD_2D_BaseView;
                    if a.frame.origin.y == 0 {
                        base1 = a;
                    }else
                    {
                        base2 = a;
                    }
                    if base1 != nil && base2 != nil {
                        var rect1 = base1!.frame;
                        var rect2 = base2!.frame;
                        rect1.origin = CGPointMake(0, 0);
                        rect1.size.height = 2.0 * rect1.size.height;
                        
                        rect2.origin.x = rect1.size.width;
                        rect2.origin.y = 0;
                        rect2.size.height = 2.0 * rect2.size.height;
                        UIView.animateWithDuration(0.5, animations: {
                            
                            base1!.frame = rect1;
                            base1!.refreshButtonFrame()
                            base1!.windowType = .IHFMD_2D_BaseView_Long;
                            
                            base2!.frame = rect2;
                            base2!.refreshButtonFrame()
                            base2!.windowType = .IHFMD_2D_BaseView_Long;
                            
                            }, completion: { (finished) in
                                self.userInteractionEnabled = true;
                        })
                        
                    }
                    
                }
            }
        }
        
    }
    
}






