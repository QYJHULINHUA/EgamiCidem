//
//  IHFRisViewController.swift
//  IHFMedicImage3.0
//
//  Created by ihefe－hulinhua on 16/5/7.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisViewController: UIViewController,IHFRisListViewDelegate,IHFRisSeriesListViewDelegate {

    var leftV : IHFRisLeftView? = nil
    let rightV = IHFRisRightView()
    let Sidebar = UIView()
    var swipeGesture:UIPanGestureRecognizer!
    var tapGesture:UITapGestureRecognizer!
    var studyModel = IHFRisStudyModel()
    
    let sideView = UIView()
    let sideViewSize = CGSizeMake(0.33 * screen_width, screen_height)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blackColor();
        let leftVRect = CGRectMake(0, 0, 0.33 * screen_width, screen_height);
        leftV = IHFRisLeftView().initWithFatherVC(fatherVC :self ,frame :leftVRect);
        self.view.addSubview(leftV!);
        leftV!.risTableView.delegate = self;
        
        rightV.frame = CGRectMake(0.33 * screen_width, 0, 0.67 * screen_width, screen_height)
        rightV.fatherVC = self
        self.view.addSubview(rightV)
        rightV.backgroundColor = UIColor.blackColor()
        rightV.seriesListView.delegate = self;
        
        
        Sidebar.frame = CGRectMake(0, 0, 3.0, screen_height)
        Sidebar.backgroundColor = UIColor.blackColor()
        Sidebar.alpha = 0.1;
        self.view.addSubview(Sidebar)
        
        swipeGesture = UIPanGestureRecognizer(target: self,action: #selector(IHFRisViewController.swipeSideBar(_:)));
        swipeGesture.maximumNumberOfTouches = 1;
        tapGesture = UITapGestureRecognizer(target: self,action: #selector(IHFRisViewController.tapSideBar));
        
        Sidebar.addGestureRecognizer(swipeGesture)
        sideView.frame = CGRect(origin:CGPointMake(-0.33 * screen_width, 0), size:sideViewSize);
        sideView.backgroundColor = UIColor.init(red: 10/255.0, green: 10/255.0, blue: 10/255.0, alpha: 1)
        self.view.addSubview(sideView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        leftV!.risTableView.loadDataForStudyList();
    }
    

    
    func swipeSideBar(swipe:UIPanGestureRecognizer)
    {
        Sidebar.alpha = 0.8;
        Sidebar.frame = self.view.bounds;
        
        var  point = swipe.locationInView(self.view)
        if point.x < 0 {
            point.x = 0
        }
        if point.x > 0.33 * screen_width {
            point.x = 0.33 * screen_width
        }
        
        sideView.frame = CGRect(origin:CGPointMake(-0.33 * screen_width + point.x, 0), size:self.sideViewSize);
        
        if swipe.state == UIGestureRecognizerState.Ended {
            if point.x < 0.05 * screen_width {
                
                UIView.animateWithDuration(0.2, animations: {
                    self.sideView.frame = CGRect(origin:CGPointMake(-0.33 * screen_width, 0), size:self.sideViewSize);
                    
                    
                    }, completion: { (false) in
                        self.Sidebar.alpha = 0.1;
                        self.Sidebar.frame = CGRectMake(0, 0, 3.0, screen_height)
                })
                
            }else
            {
                UIView.animateWithDuration(0.2) {
                    self.sideView.frame = CGRect(origin:CGPointMake(0, 0), size:self.sideViewSize);
                };
                
                Sidebar.addGestureRecognizer(tapGesture)
                Sidebar.removeGestureRecognizer(swipeGesture)

            }
        }
    }
    
    func tapSideBar()
    {
        Sidebar.frame = CGRectMake(0, 0, 3.0, screen_height)
        Sidebar.alpha = 0.1;
        Sidebar.addGestureRecognizer(swipeGesture)
        Sidebar.removeGestureRecognizer(tapGesture)
        
        UIView.animateWithDuration(0.3) {
            self.sideView.frame = CGRect(origin:CGPointMake(-0.33 * screen_width, 0), size:self.sideViewSize);
        };
    }
    
    func selectPatientStudy(studyInfo info: NSDictionary) {
        studyModel.getModelFromDctionary(info)
        rightV.reportView.setStudyInfo(studyModel)
        rightV.seriesListView.setStudyInfo(studyModel)
    }
    
    func selectPatientSerires(seriresInfo info: NSDictionary) {
        let model = IHFRis_SeriresDataModel()
        model.getModelFromDctionary(info)
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
