//
//  IHFMedicImgVC_2D.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/17.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMedicImgVC_2D: IHFMedicImgVC {

    var mainView_2D  : IHFMD_MainView! = nil
    
    
    override func viewDidLoad() {
        self.vc_type = IHFMedicImgVCType.IHFMIVC_2D
        super.viewDidLoad()
        
        let rectTemp = self.mainView.bounds
        mainView_2D = IHFMD_MainView.init(frame: rectTemp)
        self.mainView.addSubview(mainView_2D)
        self.getSeriresArrr();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(changeValueForSliderNumble(_:)), name: "IHFMD_2D_Slider_TotalNumble", object: nil)
        
    }
    
    
    func changeValueForSliderNumble(not:NSNotification) {
        
        let userInfo = not.userInfo as! [String: AnyObject]
        let totalNum = userInfo["totalNum"] as! Int
        let CurrentlNum = userInfo["CurrentlNum"] as! Int
        dispatch_async(dispatch_get_main_queue()) {
            self.rightBar.slider.setPictureTotalNumAndCurrentNum(totalNum: totalNum, currentNum: CurrentlNum)
        }
        
    }
    

    /// 退出控制器
    override func medicImgVC_Esc() {
        
        NSNotificationCenter.defaultCenter().removeObserver(self);
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// 四角信息控制显示隐藏
    override func fourInfoBtnIsShow(btn:UIButton) {
        btn.selected = !btn.selected
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSeriresArrr(){
        let path = NSBundle.mainBundle().pathForResource("imageData", ofType: "bundle");
        if path != nil
        {
            let manager = NSFileManager.defaultManager()
            let contentsOfURL = try? manager.contentsOfDirectoryAtPath(path! as String);
            if contentsOfURL != nil {
                for item in contentsOfURL! {
                    let contentsOfURL2 = try? manager.contentsOfDirectoryAtPath(path! + "/" + item as String);
                    if contentsOfURL2 != nil {
                        for item2 in contentsOfURL2! {
                            
                            let contentsOfURL3 = try? manager.contentsOfDirectoryAtPath(path! + "/" + item + "/" + item2 as String);
                            
                            for item3 in contentsOfURL3! {
                                let pinfo = IHFMedicImg2D_PInfo()
                                pinfo.patient_ID = item;
                                pinfo.study_ID = item2;
                                pinfo.serires_ID = item3;
                                mainView_2D.seriresArrr.addObject(pinfo);
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
}
