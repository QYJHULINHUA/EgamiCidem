//
//  IHFMD_MainView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/18.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMD_MainView: UIView,IHFMD_2D_BaseViewButtonDelegate,UITableViewDelegate {
    
    var baseViewArray:NSMutableArray!
    var currentBaseView:IHFMD_2D_BaseView!
    var seriresArrr = NSMutableArray()
    var cfindView : IHFMD_CFindView!
    
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        let baseView = IHFMD_2D_BaseView.getInstance(.IHFMD_2D_BaseView_All, size: frame);
        baseView.delegate = self;
        self.addSubview(baseView)
        baseViewArray = NSMutableArray.init(object: baseView);
        currentBaseView = baseView;
        self.currentBaseViweShowDiffrent();
        self.baseViewBtnShowControll();
        
        self.initCfindView();
    }
    
    
    func initCfindView() {
        
        cfindView = IHFMD_CFindView.init(frame: CGRectMake(3, 50, 320, 500));
        self.addSubview(cfindView);
        cfindView.tableView.delegate = self;
        cfindView.hidden = true;
        
    }
    
    func clickBaseViewButton(btnTag: Int, baseView: IHFMD_2D_BaseView) // 点击添加按钮
    {
        switch btnTag {
        case 1:
            self.removeBasevie(baseView);
        case 2: break
        case 3:
            self.addBaseView(baseView);
        case 4: break
            //  全屏
        case 5:
    
            if cfindView.hidden {
                cfindView.hidden = false;
                cfindView.reloadDataWithArray(seriresArrr);
            }
                
            //  cfind
        default:
            break
        }
        
        self.baseViewBtnShowControll();
        if !currentBaseView .isEqual(baseView) {
            currentBaseView = baseView;
            self.currentBaseViweShowDiffrent();
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        cfindView.hidden = true;
        
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
