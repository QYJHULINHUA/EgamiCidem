//
//  IHFLoginViewController.swift
//  IHFMedicImage3.0
//
//  Created by ihefe－hulinhua on 16/5/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFLoginViewController: UIViewController,IHFLoginViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logView = IHFLoginView.init(frame: self.view.bounds)
        logView.delegate = self;
        self.view.addSubview(logView)
        // Do any additional setup after loading the view.
    }

    
    func jumpIntoNestViewController() {
        
        
        let risVC = IHFRisViewController()
        self.presentViewController(risVC, animated: true) { () -> Void in

            risVC.leftV!.risTableView.loadDataForStudyList();
        }
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
