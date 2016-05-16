//
//  IHFRisSeriesListView.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/16.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisSeriesListView: UIView , UITableViewDataSource,UITableViewDelegate {
    
    var tableView: UITableView!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: self.bounds, style: .Plain)
        tableView.delegate = self;
        tableView.dataSource = self
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
        
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let requseIdetify = "ihfPatientListTableCell"
        var cell: IHFPatientListCell? = tableView.dequeueReusableCellWithIdentifier(requseIdetify) as? IHFPatientListCell
        if cell == nil {
            cell = IHFPatientListCell.init(style: .Default, reuseIdentifier: requseIdetify)
        }
        
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
