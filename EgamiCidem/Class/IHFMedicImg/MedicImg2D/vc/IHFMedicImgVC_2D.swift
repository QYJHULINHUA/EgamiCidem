//
//  IHFMedicImgVC_2D.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/17.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMedicImgVC_2D: IHFMedicImgVC {

    
    
    override func viewDidLoad() {
       
        self.vc_type = IHFMedicImgVCType.IHFMIVC_2D
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func medicImgVC_Esc() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}