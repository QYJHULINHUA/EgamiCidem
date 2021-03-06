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

        NSNotificationCenter.defaultCenter().postNotificationName("IHFMD_2D_Slider_TotalNumble",
                object: nil,
                userInfo: ["totalNum":56, "CurrentlNum" : 28])
            
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
                let imageData = GLES_ImageData.GLESWithImage(response as! UIImage, isunsigned: false)
                if self.openGLVC == nil
                {
                    [self .addOpenGlView(ImageData: imageData, RealAspect: 1)];
                }
            }
        }
    
    }
    
    
    func removeGLView(){
        
        if (openGLVC != nil) {
//            [self removeGLViewController:self.openGLVC];
            self.openGLVC = nil;
            
        }
    }
    
    func addOpenGlView(ImageData data:GLES_ImageData,RealAspect aspect:CGFloat) {
        let openGLVC = IHFMyGLKViewController();
        openGLVC.imgRealAspect = aspect;
        openGLVC.sourceimageData = data;
        let pana = UIPanGestureRecognizer.init(target: openGLVC, action: #selector(IHFMyGLKViewController.PanGestHandle(_:)));
        self.addGestureRecognizer(pana)
        
        let pin = UIPinchGestureRecognizer.init(target: openGLVC, action: #selector(IHFMyGLKViewController.getScaleAndLocation(_:)));
        self.addGestureRecognizer(pin)
        

        let selfVC = self.getCurrentViewVC(self)
        self.insertSubview(openGLVC.view, atIndex: 0)
        selfVC?.addChildViewController(openGLVC);
        openGLVC.view.frame = self.frame;
        let fisrtDcm = self.reqClass.seriesMhd.dcmPictrueInfoArray[0] as! IHFMD_2D_dcmPictureInfo;
        
        let  wl  =  CGFloat ( (fisrtDcm.defaultWL as NSString).floatValue)
        let  ww  =  CGFloat ( (fisrtDcm.defaultWW as NSString).floatValue)
        openGLVC.setWindowLevel(wl, windowWidth: ww);
        openGLVC.setColorTableNumber(0);
        self.openGLVC = openGLVC;
        
    }
    
    func getCurrentViewVC(view:UIView) ->IHFMedicImgVC_2D?{
        
        var next:UIResponder? = view.nextResponder();
        repeat
        {
            let istrue = next!.isKindOfClass(IHFMedicImgVC_2D);
            if istrue
            {
                return next as? IHFMedicImgVC_2D;
            }else
            {
                next = next?.nextResponder();
            }
            
        }while (next != nil);
        
        return nil;
    }
    
    
}
