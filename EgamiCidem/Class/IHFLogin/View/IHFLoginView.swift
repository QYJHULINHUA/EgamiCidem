//
//  IHFLoginView.swift
//  IHFMedicImage3.0
//
//  Created by ihefe－hulinhua on 16/5/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

protocol IHFLoginViewDelegate:NSObjectProtocol{
    func jumpIntoNestViewController()
}



class IHFLoginView: UIView {
    
    weak var delegate:IHFLoginViewDelegate? //代理
    
    let userField = UITextField()
    let pwField   = UITextField()
    let loadBtn   = UIButton()
    
    /// 账户信息单例
    let accontModel = IHFMAccountModel.shareSingleOne
    

    required override init(frame: CGRect) {
        
        super.init(frame:frame)
        self.backgroundColor = BackColor
        var backImgName = "default"

        if (screen_width * screen_height) > 1398000
        {
            backImgName = "IHEFEVersionPRO.png"
            userField.frame = CGRectMake(523.0, 423.0, 390.0, 62.0);
            pwField.frame = CGRectMake(523.0, 500.0, 390.0, 62.0);
            loadBtn.frame = CGRectMake(463.0, 622.0, 440.0, 62.0);
        }else
        {
            backImgName = "IHEFEVersion.png"
            userField.frame = CGRectMake(352.0, 301.0, 390.0, 62.0);
            pwField.frame = CGRectMake(352.0, 374.0, 390.0, 62.0);
            loadBtn.frame = CGRectMake(292.0, 500.0, 440.0, 62.0);
        }
        
        userField.textColor = UIColor.whiteColor()
        pwField.textColor = UIColor.whiteColor()
        loadBtn.addTarget(self, action: "loginBtnTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        userField.text = "fskzr"
        pwField.text = "1234567"
    
        let backImgView = UIImageView(frame: self.bounds)
        backImgView.image = UIImage.init(named: backImgName);
        self.addSubview(backImgView)
        self.addSubview(userField)
        self.addSubview(pwField)
        self.addSubview(loadBtn)
    }
    
    
    func loginBtnTouch(btn:UIButton)
    {
        let isempty = userField.text!.isEmpty || pwField.text!.isEmpty
        if isempty
        {
            SweetAlert().showAlert("请填写账户和密码!")

        }else
        {
            accontModel.accountID = userField.text!
            accontModel.accountPW = pwField.text!
            let loginModel = IHFN_Login()
            loginModel.loginAccount(accoutID: userField.text!, password: pwField.text!, callback: { (statusCode, response) -> Void in

                if statusCode == 1
                {
                    
                    

                    
                    
                }else
                {
                    
                }
                
                
            })
            

            
        }
    }
    
    func successJumpIntoRisViewControoler()
    {
        let canDo :Bool = delegate!.respondsToSelector(Selector("jumpIntoNestViewController"));
        
        if(canDo){
            delegate?.jumpIntoNestViewController()
        }else{
            print("login_view 跳转失败")
        }
    }
   

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
