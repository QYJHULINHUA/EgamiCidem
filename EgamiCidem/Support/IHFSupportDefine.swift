//
//  IHFSupportDefine.swift
//  IHFMedicImage3.0
//
//  Created by ihefe－hulinhua on 16/5/7.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import Foundation
import UIKit

let BackColor = UIColor.init(red: 10.0/255, green: 10.0/255, blue: 10.0/255, alpha: 1)
let screen_width = UIScreen.mainScreen().bounds.size.width
let screen_height = UIScreen.mainScreen().bounds.size.height

//let BaseURL = "http://192.168.10.20:50003"
let BaseURL = "http://101.231.149.89:50003"
let risUrl = "/phillips/ihefeMedImgRIS/index.php?m=Api&c=Ris"

typealias IHFNet_CallBack = (statusCode:Int ,response:Any)->Void



