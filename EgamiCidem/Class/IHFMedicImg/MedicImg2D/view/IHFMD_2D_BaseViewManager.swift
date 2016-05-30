//
//  IHFMD_2D_BaseViewManager.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/30.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import Foundation

extension IHFMD_2D_BaseView
{
    
    
    // MARK 第一次配置信息
    func configPatientInfo(pinfo pf:IHFMedicImg2D_PInfo) {
        self.reqClass.setNewPinfo(pf);
        weak var weakSelf:IHFMD_2D_BaseView! = self
        self.reqClass.getSeriesMHD { (statusCode, response) in
            
            
            weakSelf.reqPicture(pictureIdx: 0, isMove: false);
        }
    }
    
    // 请求图片
    func reqPicture(pictureIdx idx:Int, isMove move:Bool){
     
        self.reqClass.getPictrueDataFor2D(pictureIdx: 0, isMove: false) { (statusCode, response) in
        
            if statusCode < 0
            {
                print("error get image")
            }else
            {
                
            }
        }
    
    }
    
}
