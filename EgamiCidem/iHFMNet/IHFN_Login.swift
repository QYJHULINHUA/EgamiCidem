//
//  IHFN_Login.swift
//  IHFMedicImage3.0
//
//  Created by ihefe－hulinhua on 16/5/9.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit
import Foundation


class IHFN_Login: NSObject {
    
    func loginAccount(accoutID st1:String, password str2:String, callback responseddd:IHFNet_CallBack)
    {

        let url = BaseURL + risUrl + "&action=1002&username=" + st1 + "&password=" + str2
        
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer.acceptableContentTypes = NSSet.init(array: ["application/xml","text/html"]) as Set<NSObject>
        let op = manager.GET(url, parameters: nil, success: { (operation: AFHTTPRequestOperation!,
            responseObject: AnyObject!) -> Void in
            
            let data = responseObject!
            let json : AnyObject! = try? NSJSONSerialization
                .JSONObjectWithData(data as! NSData, options:NSJSONReadingOptions.AllowFragments)

            let dic = json!
            responseddd(statusCode: 1, response:dic)
         
            
            }) { (operation: AFHTTPRequestOperation!,
                error: NSError!) -> Void in
                print(error.localizedDescription)
                responseddd(statusCode: 0, response: error.localizedDescription)
                
        }
        
        
        op.responseSerializer = AFHTTPResponseSerializer()
        op.start()
        

    }
}
