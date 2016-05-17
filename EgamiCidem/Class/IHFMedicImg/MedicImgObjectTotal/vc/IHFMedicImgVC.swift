//
//  IHFMedicImgVC.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/17.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

enum IHFMedicImgVCType {
    case IHFMIVC_2D
    case IHFMIVC_3D
    case IHFMIVC_MPR
    case IHFMIVC_MPRT
    case IHFMIVC_Feature
}

class IHFMedicImgVC: UIViewController {

    var vc_type = IHFMedicImgVCType.IHFMIVC_2D // Default
    let leftbar = IHFM_VC_LeftToolBar()
    let rightBar = IHFM_VC_RightToolBar()
    let mainView = UIView()
    
    private let bar_Width = screen_height * 0.07;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        leftbar.frame = CGRectMake(0, 0, bar_Width, screen_height)
        self.view.addSubview(leftbar)
        leftbar.escBtn.addTarget(self, action: #selector(IHFMedicImgVC.medicImgVC_Esc), forControlEvents: .TouchUpInside)
        
        rightBar.frame = CGRectMake(screen_width - bar_Width, 0, bar_Width, screen_height)
        self.view.addSubview(rightBar)
        
        mainView.frame = CGRectMake(bar_Width, 0, screen_width - 2 * bar_Width, screen_height)
        self.view.addSubview(mainView)
        mainView.backgroundColor = UIColor.blackColor()
        
        switch vc_type {
        case .IHFMIVC_2D:
            print("IHFMIVC_2D")
            
        case .IHFMIVC_3D:
            print("IHFMIVC_3D")
            
        case .IHFMIVC_MPR:
            print("IHFMIVC_MPR")
            
        case .IHFMIVC_MPRT:
            print("IHFMIVC_MPRT")
            
        case .IHFMIVC_Feature:
            print("IHFMIVC_Feature")
            
        }

        // Do any additional setup after loading the view.
    }
    
    func medicImgVC_Esc() {
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
