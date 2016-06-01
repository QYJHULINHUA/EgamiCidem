//
//  IHFReq_2D.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/25.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFReq_2D: IHFMedicImgReqClass {
    
    public typealias IHFReq_CallBack = (statusCode:Int ,response:Any)->Void
    
    var pinfo = IHFMedicImg2D_PInfo();
    let seriesMhd = IHFMD_2D_SeriesMHD()
    let bundlePath = NSBundle.mainBundle().pathForResource("imageData", ofType: "bundle");
    
    
    // 配置pinfo信息
    func setNewPinfo(newPinfo : IHFMedicImg2D_PInfo) {
        pinfo = newPinfo;
    }
    
    // 请求mhd信息
    func getSeriesMHD(callBack:IHFReq_CallBack) {
        
        let mhdPath = bundlePath!  + "/\(pinfo.patient_ID)/\(pinfo.study_ID)/\(pinfo.serires_ID)/\(pinfo.serires_ID)/seriesInfo.json"
        
        let jsonStr = try? NSString.init(contentsOfFile: mhdPath, encoding: NSISOLatin1StringEncoding)
        if jsonStr == nil {
            callBack (statusCode: -1,response: "取mhd异常")
        }else
        {
            let jsonData = jsonStr?.dataUsingEncoding(NSUTF8StringEncoding)
            let dic = try? NSJSONSerialization.JSONObjectWithData(jsonData!, options:.MutableContainers);
            if dic == nil {
                callBack (statusCode: -1,response: "解析mhd异常");
            }else
            {
                seriesMhd.mhdJson = dic as! [NSObject : NSDictionary];
                callBack (statusCode: 1,response: "成功");
            }
        }
    }
    
    // 请求图片
    func getPictrueDataFor2D(pictureIdx idx:Int, isMove move:Bool, callBack:IHFReq_CallBack) {
        let dcmInfo = seriesMhd.dcmPictrueInfoArray[idx] as! IHFMD_2D_dcmPictureInfo;
        
        let orientation = dcmInfo.img_Orientation.lowercaseString;
        let picIdx:String = String(format: "%04D", idx + 1)
        let filePath = bundlePath!  + "/\(pinfo.patient_ID)/\(pinfo.study_ID)/\(pinfo.serires_ID)/\(pinfo.serires_ID)/\(orientation)/\(picIdx).png"
        
        let cacheImg = UIImage.init(contentsOfFile: filePath)
        
        if cacheImg == nil {
            callBack (statusCode: -1,response: "取图片失败");
        }else
        {
            callBack (statusCode: 1,response: cacheImg);
        }
    }
    
}
