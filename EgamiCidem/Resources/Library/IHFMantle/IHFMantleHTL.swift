//
//  IHFMantleHTL.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/13.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMantleHTL: NSObject {
    
    var property = [:]
    
    func getModelFromDctionary(dic :NSDictionary) {
        
        let keyArr = property.allKeys;
        for key in keyArr {
            
            let dicValue = dic[key as! String];
            let origin_value = property[key as! String];
            
            if dicValue != nil {

                let a :AnyObject = origin_value!.classForCoder
                let b :AnyObject = dicValue!.classForCoder
                if a.isEqual(b) {
                    self.setValue(dicValue, forKey: key as! String);
                }
            }
        }
    }

}
