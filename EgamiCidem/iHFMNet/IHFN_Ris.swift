//
//  IHFN_Ris.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/13.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFN_Ris: NSObject {

    var op : AFHTTPRequestOperation?
    var seriesOP : AFHTTPRequestOperation?
    
    let searchModel = SearchDicModel()
    var pageNum = 1
    var pagesize = 15
    
    // 请求study列表
    func getStudyList(param pa:NSDictionary, callback responseddd:IHFNet_CallBack)
    {
        if op != nil {
           if op!.executing == true
           {
            op!.cancel();
            }
        }
        searchModel.getModelFromDctionary(pa);
        let manager = AFHTTPRequestOperationManager();
        manager.responseSerializer.acceptableContentTypes = NSSet.init(array: ["application/xml","text/html"]) as Set<NSObject>
        let uid = IHFMAccountModel.shareSingleOne.account_uid;
        let url = BaseURL + risUrl + "&action=1003&uid=\(uid)&pagenum=\(pageNum)&pagesize=\(pagesize)&day=\(searchModel.day)&modality=\(searchModel.modality)&exambodypart=\(searchModel.exambodypart)&reqdept=\(searchModel.reqdept)&search=\(searchModel.search)&Aregdate=\(searchModel.aregdate)&Bregdate=\(searchModel.bregdate)"
        
        op = manager.GET(url, parameters: nil, success: { (Operation: AFHTTPRequestOperation!, response:AnyObject!) in
        
            let model = RisCallBackModel()
            IHFN_Ris.handleRisNetSuccessCallBack(model: model, response: response, callback: responseddd)
            
            }, failure: { (Operation: AFHTTPRequestOperation!, error: NSError!) in
                responseddd(statusCode: 0, response:error.localizedDescription)
                
        })
        
        op!.start();
        
    }
    
    // 请求序列列表
    func getSeriesList(stu_id stuid:String,relatetopacs relate:String ,callback responseddd:IHFNet_CallBack){
        
        let url = BaseURL + risUrl + "&action=1011&stu_id=\(stuid)&relatetopacs=\(relate)"
        
        if seriesOP != nil {
            if seriesOP!.executing == true
            {

                seriesOP!.cancel();
            }
        }
        
        
        let manager = AFHTTPRequestOperationManager();
        manager.responseSerializer.acceptableContentTypes = NSSet.init(array: ["application/xml","text/html"]) as Set<NSObject>
        
        seriesOP = manager.GET(url, parameters: nil, success: { (Operation: AFHTTPRequestOperation!, response:AnyObject!) in
            let model = RisCallBackModel()
            IHFN_Ris.handleRisNetSuccessCallBack(model: model, response: response, callback: responseddd)
            
            }, failure: { (Operation: AFHTTPRequestOperation!, error: NSError!) in
            
            responseddd(statusCode: 0, response:error.localizedDescription)
        })
        
        seriesOP!.start();
    }
    
    // 处理study，serire列表网络成功回调
    class func handleRisNetSuccessCallBack(model model:RisCallBackModel,response:AnyObject,callback responseddd:IHFNet_CallBack) {
        
        if response.isKindOfClass(NSDictionary)
        {
            model.getModelFromDctionary(response as! NSDictionary)
            if model.status == 1
            {
                responseddd(statusCode: 1, response:model)
            }else
            {
                responseddd(statusCode: 0, response:model.msg)
            }
            
            
        }else
        {
            responseddd(statusCode: 0, response:"errorCode:-101") // 网络回调数据类型异常
        }
    }
    
    
}



class SearchDicModel: IHFMantleHTL {
    var day = ""
    var modality = ""
    var exambodypart = ""
    var reqdept = ""
    var search = ""
    var aregdate = ""
    var bregdate = ""
    
    required override init() {
        super.init();
        property = ["day":"","modality":"","exambodypart":"","reqdept":"","search":"","aregdate":"","bregdate":""]
    }
}

class RisCallBackModel: IHFMantleHTL {
    var action = "-100";
    var data = [];
    var msg = "Unknown Error"
    var status = 0
    
    
    required override init() {
        super.init();
        property = ["action":"-100","data":[],"msg":"","status":0]
    }
}
