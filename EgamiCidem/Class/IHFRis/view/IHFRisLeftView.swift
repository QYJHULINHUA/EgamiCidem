//
//  IHFRisLeftView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/11.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisLeftView: UIView {

    weak var fatherVC:IHFRisViewController?
    var topBar: IHFRisLeftTopBar?
    var risTableView : IHFRisListView!
    

    func initWithFatherVC(fatherVC vc: IHFRisViewController,frame frme1: CGRect) -> IHFRisLeftView
    {
        let instance = IHFRisLeftView.init(frame: frme1);
        instance.fatherVC = vc;
        return instance;
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        
        // 添加顶部栏
        topBar = IHFRisLeftTopBar.init(frame: CGRectMake(0, 0, frame.size.width, 50));
        self.addSubview(topBar!);
        topBar!.leftBtn.addTarget(self, action: #selector(IHFRisLeftView.touchLeftButton(leftBtn:)), forControlEvents: UIControlEvents.TouchUpInside)
        risTableView = IHFRisListView.init(frame: CGRectMake(0, 50, frame.size.width, frame.size.height - 50 ));
        self.addSubview(risTableView);
        
        
        
        
    }
    
    func touchLeftButton(leftBtn btn:UIButton)
    {
        if self.fatherVC == nil {
            return;
        }
        let searchView = IHFRisSearchView.init(frame: fatherVC!.view.bounds);
        searchView.backgroundColor = UIColor.blackColor();
        fatherVC!.view.addSubview(searchView);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

/// 顶部工具栏
//protocol IHFRisLeftTopBarDelegate:NSObjectProtocol{
//    
//}

class IHFRisLeftTopBar: UIView {
    
    let leftBtn = UIButton()
    let rightBtn = UIButton()
    let centerLabel = UILabel()
    
//    weak var delegate:IHFLoginViewDelegate? //代理
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 40/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1)
        
        leftBtn.frame = CGRectMake(20, 10, 40, 40);
        leftBtn.setImage(UIImage.init(named: "IHFMsearch"), forState: UIControlState.Normal)
        centerLabel.frame = CGRectMake(60, 10, frame.size.width - 110, 40);
        centerLabel.text = "所有影像";
        centerLabel.textColor = UIColor.whiteColor();
        centerLabel.textAlignment = NSTextAlignment.Center;
        rightBtn.frame = CGRectMake(frame.size.width - 50, 10, 40, 40);
        rightBtn.setImage(UIImage.init(named: "IHFList"), forState: UIControlState.Normal)
        self.addSubview(leftBtn)
        self.addSubview(centerLabel)
        self.addSubview(rightBtn)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}












