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

    /************************************************************************/
    // .h
    var vc_type = IHFMedicImgVCType.IHFMIVC_2D // Default
    var leftbar: IHFM_VC_LeftToolBar?
    var rightBar : IHFM_VC_RightToolBar!
    let mainView = UIView()
    
    /// 退出控制器
    func medicImgVC_Esc() {
        
    }
    
    /// 四角信息控制显示隐藏
    func fourInfoBtnIsShow(btn:UIButton) {
        btn.selected = !btn.selected
        print(btn.selected)
    }
    
    /************************************************************************/
   // .m
    
    private let bar_Width = screen_height * 0.07;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        leftbar = IHFM_VC_LeftToolBar.init(frame: CGRectMake(0, 0, bar_Width, screen_height))
        self.view.addSubview(leftbar!)
        leftbar!.escBtn.addTarget(self, action: #selector(IHFMedicImgVC.medicImgVC_Esc), forControlEvents: .TouchUpInside)
        leftbar!.fourInfoBtn.addTarget(self, action: #selector(IHFMedicImgVC.fourInfoBtnIsShow(_:)), forControlEvents: .TouchUpInside)
        
        rightBar = IHFM_VC_RightToolBar.init(frame: CGRectMake(screen_width - bar_Width, 0, bar_Width, screen_height));
        self.view.addSubview(rightBar)
        
        mainView.frame = CGRectMake(bar_Width, 0, screen_width - 2 * bar_Width, screen_height)
        self.view.addSubview(mainView)
        mainView.backgroundColor = UIColor.blackColor()
        
        // Do any additional setup after loading the view.
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
