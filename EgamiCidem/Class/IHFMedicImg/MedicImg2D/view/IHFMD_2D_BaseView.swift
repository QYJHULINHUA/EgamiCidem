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

protocol IHFMD_2D_BaseViewButtonDelegate:NSObjectProtocol {
    /**!
     @点击添加按钮
     @btnTag= [1,2,3,4,5]对应［"删除","联动","添加","全屏","cfind"］
     */
    func clickBaseViewButton(btnTag: Int, baseView:IHFMD_2D_BaseView);
}


class IHFMD_2D_BaseView: UIView {
    
    var windowType :IHFMD_2D_BaseViewType!
    weak var delegate :IHFMD_2D_BaseViewButtonDelegate?
    
    let deleBtn = UIButton();
    let linkBtn = UIButton();
    let addBtn = UIButton();
    let fullBtn = UIButton();
    let cfindBtn = UIButton();
    let reqClass = IHFReq_2D();
    
    
    private let ToolButtonWH:CGFloat = 34.0
    private let ToolButton_SpaceX:CGFloat = 12.0
    private let ToolButton_SpaceY:CGFloat = 10.0
    private var btnArray = [];
    
    
    // 创建baseview
    class func getInstance(type :IHFMD_2D_BaseViewType,size :CGRect)->IHFMD_2D_BaseView
    {
        let tempSize = IHFMD_2D_BaseView.getBaseViewSize(type, size: size);
        
        let baseView = IHFMD_2D_BaseView.init(frame: tempSize);
        baseView.backgroundColor = UIColor.blackColor();
        baseView.layer.borderWidth = 1.0;
        baseView.layer.borderColor = UIColor.init(red: 60.0 / 255.0, green: 60.0 / 255.0, blue: 60.0 / 255.0, alpha: 1).CGColor;
        baseView.windowType = type;
        baseView.addButton();
        

        let tapGesture = UITapGestureRecognizer.init(target: baseView, action: #selector(IHFMD_2D_BaseView.tapGestureSelfView));
        baseView.addGestureRecognizer(tapGesture)
        
        return baseView;
    }

    // 获得baseview size
    class func getBaseViewSize(type:IHFMD_2D_BaseViewType,size:CGRect)->CGRect
    {
        
        
        let W = size.width;
        let h = size.height;
        var baseSize = CGRectZero;
        
        switch type {
        case .IHFMD_2D_BaseView_All:
            baseSize = CGRectMake(0, 0, W, h);
            
        case .IHFMD_2D_BaseView_Long:
            baseSize = CGRectMake(0.5 * W, 0, 0.5 * W, h)
            
        case .IHFMD_2D_BaseView_Small:
            baseSize = CGRectMake(size.origin.x, 0.5 * h, W, 0.5 * h);
        }
        
        return baseSize;
    }
    
    // 添加baseview按钮
    func addButton() {
        deleBtn.setImage(UIImage.init(named: "关闭窗口"), forState: .Normal)
        self.addSubview(deleBtn);
        
        linkBtn.setImage(UIImage.init(named: "未联动"), forState: .Normal)
        linkBtn.selected = false;
        self.addSubview(linkBtn);
        
        addBtn.setImage(UIImage.init(named: "添加窗口"), forState: .Normal)
        self.addSubview(addBtn);
        
        fullBtn.setImage(UIImage.init(named: "全屏"), forState: .Normal)
        self.addSubview(fullBtn);
        
        cfindBtn.setImage(UIImage.init(named: "加载图片"), forState: .Normal)
        self.addSubview(cfindBtn);
        
        btnArray = [deleBtn,linkBtn,addBtn,fullBtn,cfindBtn];
        
        for index in 0..<btnArray.count {
            let btn = btnArray[index] as! UIButton;
            btn.tag = index + 1;
            btn.addTarget(self, action: #selector(IHFMD_2D_BaseView.clickButton(_:)), forControlEvents: .TouchUpInside);
        }
        
        self.refreshButtonFrame();
    }
    
    func tapGestureSelfView() {
        
        if delegate != nil
        {
            let canDo = delegate!.respondsToSelector(#selector(IHFMD_MainView.clickBaseViewButton(_:baseView:)))
            if canDo {
                delegate!.clickBaseViewButton(6, baseView: self);
            }
        }
    }
    
    // 点击baseview上面的button
    func clickButton(btn:UIButton) {
        
        if delegate != nil
        {
           let canDo = delegate!.respondsToSelector(#selector(IHFMD_MainView.clickBaseViewButton(_:baseView:)))
            if canDo {
                if btn.tag == 2 {
                    btn.selected = !btn.selected;
                    if btn.selected == true {
                        linkBtn.setImage(UIImage.init(named: "联动"), forState: .Normal)
                    }else
                    {
                        linkBtn.setImage(UIImage.init(named: "未联动"), forState: .Normal)
                    }
                }
                delegate!.clickBaseViewButton(btn.tag, baseView: self);

            }
        }
    }
    
    // 刷新按钮frame
    func refreshButtonFrame() {
        deleBtn.frame = CGRectMake(self.frame.size.width - ToolButtonWH - ToolButton_SpaceX, ToolButton_SpaceY, ToolButtonWH, ToolButtonWH)
        linkBtn.frame = CGRectMake(self.deleBtn.frame.origin.x - ToolButton_SpaceX - ToolButtonWH, ToolButton_SpaceY, ToolButtonWH, ToolButtonWH)
        addBtn.frame = CGRectMake(self.linkBtn.frame.origin.x - ToolButton_SpaceX - ToolButtonWH, ToolButton_SpaceY, ToolButtonWH, ToolButtonWH)
        fullBtn.frame = CGRectMake(self.addBtn.frame.origin.x - ToolButton_SpaceX - ToolButtonWH, ToolButton_SpaceY, ToolButtonWH, ToolButtonWH)
        cfindBtn.frame = CGRectMake(ToolButton_SpaceX, ToolButton_SpaceY, ToolButtonWH, ToolButtonWH)
    }
    
}
