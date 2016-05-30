//
//  IHFMD_CFindView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/30.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFMD_CFindView: UIView,UITableViewDataSource {
    
    var tableView: UITableView!
    var dataArr = NSMutableArray()
    

    required override init(frame: CGRect) {
        super.init(frame: frame);
        tableView = UITableView(frame: self.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.rowHeight = 65;
        tableView.separatorStyle = .SingleLine;
        tableView.separatorColor = UIColor.init(white: 1, alpha: 0.5)

        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        tableView.backgroundColor = UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        self.addSubview(tableView)
    }
    
    func reloadDataWithArray(dataArrInput :NSMutableArray)  {
        dataArr = dataArrInput;
        tableView.reloadData();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**_____________________________________________________________________*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let requseIdetify = "ihfPatientListTableCell"
        var cell: IHFMD_CFindTableCell? = tableView.dequeueReusableCellWithIdentifier(requseIdetify) as? IHFMD_CFindTableCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("IHFMD_CFindTableCell", owner: nil, options: nil).first as? IHFMD_CFindTableCell
            
        }
        let pinfo = dataArr[indexPath.row] as! IHFMedicImg2D_PInfo;
        cell!.patientID.text = pinfo.patient_ID;
        cell!.studiID.text = pinfo.study_ID;
        cell!.seriesID.text = pinfo.serires_ID;
        
        return cell!
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
