//
//  IHFRisSeriesListView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/16.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

protocol IHFRisSeriesListViewDelegate:NSObjectProtocol {
    
    func selectPatientSerires(seriresInfo info: NSDictionary)
}


class IHFRisSeriesListView: UIView , UITableViewDataSource,UITableViewDelegate {
    
    var tableView: UITableView!
    weak var study_Info:IHFRisStudyModel?
    var seriresArray = []
    weak var delegate:IHFRisSeriesListViewDelegate?
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: self.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120;
        
        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.separatorColor = UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor.blackColor()
        self.addSubview(tableView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**_____________________________________________________________________*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return seriresArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let requseIdetify = "ihfSeriresListTableCell"
        var cell: IHFRIS_SeriresCell? = tableView.dequeueReusableCellWithIdentifier(requseIdetify) as? IHFRIS_SeriresCell
        if cell == nil {
            cell = IHFRIS_SeriresCell.init(style: .Default, reuseIdentifier: requseIdetify)
        }
        
        var dic = [:]
        if indexPath.row < seriresArray.count  {
            let modelDic = seriresArray[indexPath.row];
            if modelDic.isKindOfClass(NSDictionary) {
                dic = modelDic as! NSDictionary;
            }
        }
        let model = IHFRis_SeriresDataModel()
        model.getModelFromDctionary(dic)
        cell!.date.text = "时间  " + model.updatetime
        cell!.imageNumble.text = String(model.dcm.count)
        cell?.Thumbnail.image = UIImage.init(data: IHFRisSeriesListView.decodeBase64String(model.icon))
        if study_Info != nil {
            cell!.hospitalName.text = "医院  " + study_Info!.reqhospital;
            cell!.modility.text = study_Info!.modality;
        }
        

        return cell!
    }
    
    /*!
     解码base64转码的图片
     
     - parameter str: base64转化后的图片字符串
     
     - returns: 图片数据
     */
    class func decodeBase64String(str:String) -> NSData {
        var data = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        data = GTMBase64.decodeData(data)
        if data != nil {
            return data!
        }else
        {
            return NSData()
        }
        
    }
    
    func setStudyInfo(info: IHFRisStudyModel){
        seriresArray = []
        tableView.reloadData();
        
        self.study_Info = info;
        let net = IHFN_Ris()
        weak var weakSelf :IHFRisSeriesListView! = self;
        net.getSeriesList(stu_id: info.stu_id, relatetopacs: info.relatetopacs) { (statusCode, response) in
            
            if statusCode == 1
            {
                let model:RisCallBackModel = response as! RisCallBackModel;
                weakSelf.seriresArray = model.data;
                weakSelf.tableView.reloadData();
                
            }else
            {
                SweetAlert().showAlert(response as! String);
            }
            
        }
        
    }

    
    // 点击系列
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let idx = indexPath.row;
        if idx < seriresArray.count {
            let a = seriresArray[idx]
            if a.isKindOfClass(NSDictionary)
            {
                if delegate != nil {
                    let canDo:Bool = delegate!.respondsToSelector(#selector(IHFRisViewController.selectPatientSerires(seriresInfo:)))
                    if canDo {
                        delegate!.selectPatientSerires(seriresInfo: a as! NSDictionary)
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
