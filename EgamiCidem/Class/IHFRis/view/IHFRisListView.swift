//
//  IHFRisListView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/11.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

protocol IHFRisListViewDelegate:NSObjectProtocol {
    
    func selectPatientStudy(studyInfo info: NSDictionary)
}

class IHFRisListView: UIView ,UITableViewDataSource,UITableViewDelegate {
    
    private var tableView: UITableView!
    var studyListArr = [];
    let risNet = IHFN_Ris()
    
    weak var delegate:IHFRisListViewDelegate?
    
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.greenColor()
        
    
        tableView = UITableView(frame: self.bounds, style: .Plain)
        tableView.delegate = self;
        tableView.dataSource = self
        tableView.rowHeight = 70;

        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.separatorColor = UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor.blackColor()
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
        
        let requseIdetify = "ihfPatientListTableCell"
        var cell: IHFPatientListCell? = tableView.dequeueReusableCellWithIdentifier(requseIdetify) as? IHFPatientListCell
        if cell == nil {
            cell = IHFPatientListCell.init(style: .Default, reuseIdentifier: requseIdetify)
        }
        
        var dic = [:]
        if indexPath.row < studyListArr.count  {
            let modelDic = studyListArr[indexPath.row];
            if modelDic.isKindOfClass(NSDictionary) {
                dic = modelDic as! NSDictionary;
            }
        }
        let model = IHFPatientListDataModel()
        model.getModelFromDctionary(dic)
        
        cell!.patient_Name.text = model.name;
        cell!.patient_ID.text = model.patientid;
        cell!.patient_checkDate.text = model.regdate;
        cell!.patient_modality.text = model.modality;
        cell!.patient_seriesInfo.text = model.patient_seriesInfo;
        cell!.patient_barthDate.text = model.birthdate;
    
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let idx = indexPath.row;
        if idx < studyListArr.count {
            let a = studyListArr[idx]
            if a.isKindOfClass(NSDictionary)
            {
                if delegate != nil {
                    let canDo:Bool = delegate!.respondsToSelector(#selector(IHFRisViewController.selectPatientStudy(studyInfo:)))
                    if canDo {
                        delegate!.selectPatientStudy(studyInfo: a as! NSDictionary)
                    }
                    
                }
                
            }
            
        }
        
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}


class IHFPatientListDataModel: IHFMantleHTL {
    
    var name = ""
    var patientid = ""
    var regdate = ""
    var modality = ""
    var patient_seriesInfo = ""
    var birthdate = ""
    
    required override init() {
        super.init();
        property = ["name":"","patientid":"","regdate":"","modality":"","patient_seriesInfo":"","birthdate":""]
    }
}
