//
//  IHFRisListView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/11.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisListView: UIView ,UITableViewDataSource,UITableViewDelegate {
    
    private var tableView: UITableView!
    weak var delegate:UITableViewDelegate? //代理
    var studyListArr = [];
    let risNet = IHFN_Ris()
    
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.greenColor()
        
    
        tableView = UITableView(frame: self.bounds, style: .Plain)
        tableView.delegate = self;
        tableView.dataSource = self

        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        self.addSubview(tableView)
        
//        tableView.addBounceHeadRefresh(self,bgColor:UIColor.orangeColor(),loadingColor:UIColor.blueColor(), action: #selector(IHFRisListView.headRefresh))
        
        tableView.addFootRefresh(self, action: #selector(IHFRisListView.footRefresh));
        tableView.addHeadRefresh(self, action: #selector(IHFRisListView.headRefresh));
        
        
        
    }

//----------------------- reload tableview data  ------------------------
    func loadDataForStudyList()
    {
        studyListArr = [];
        tableView.reloadData();
        weak var weakSelf :IHFRisListView! = self;
        
        let paramDic = [:];
        risNet.getStudyList(param: paramDic) { (statusCode, response) in
            
            if statusCode == 1
            {
                let model:RisCallBackModel = response as! RisCallBackModel;
                weakSelf.studyListArr = model.data;
                
            }else
            {
                SweetAlert().showAlert(response as! String);
            }
            weakSelf.tableView.reloadData();
        }
    }
    
    func footRefresh()  {
        risNet.pagesize = risNet.pagesize + 10;
        weak var weakSelf :IHFRisListView! = self;
        let paramDic = [:];
        risNet.getStudyList(param: paramDic) { (statusCode, response) in
            
            if statusCode == 1
            {
                let model:RisCallBackModel = response as! RisCallBackModel;
                weakSelf.studyListArr = model.data;
                
            }else
            {
                SweetAlert().showAlert(response as! String);
            }
            weakSelf.tableView.reloadData();
            weakSelf.tableView.tableFootStopRefreshing()
        }
    }
    
    func headRefresh()  {
    
        risNet.pagesize = 15;
        weak var weakSelf :IHFRisListView! = self;
        let paramDic = [:];
        risNet.getStudyList(param: paramDic) { (statusCode, response) in
            
            if statusCode == 1
            {
                let model:RisCallBackModel = response as! RisCallBackModel;
                weakSelf.studyListArr = model.data;
                
            }else
            {
                SweetAlert().showAlert(response as! String);
            }
            weakSelf.tableView.reloadData();
            weakSelf.tableView.tableHeadStopRefreshing()
        }


    }
    
//----------------------- reload tableview data  ------------------------
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    
    /**_____________________________________________________________________*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return studyListArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            cell!.contentView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        }
        
        if let cell = cell {
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        
        return UITableViewCell()
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
