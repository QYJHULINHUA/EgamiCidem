//
//  IHFMAccountModel.swift
//  IHFMedicImage3.0
//
//  Created by ihefe－hulinhua on 16/5/9.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMAccountModel: NSObject {
    
    static let shareSingleOne = IHFMAccountModel()
    
    var accountName = "&&用户名字"
    var accountID = "&&用户账户"
    var accountPW = "&&用户密码"
    var account_uid = "0"
    var write = "0"
    var check = "0"
    var token = "830aagd"
    
    func setAccountInfo(logDci dic : NSDictionary)
    {
        accountName = dic["doctor_name"] as! String
        account_uid = dic["uid"] as! String
        write = dic["write"] as! String
        check = dic["check"] as! String
        token = dic["token"] as! String
    }
    
}
