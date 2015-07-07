//
//  ViewController.swift
//  FetchDemo
//
//  Created by 范鸿麟 on 15/7/7.
//  Copyright (c) 2015年 范鸿麟. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var dates:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init tableView
        tableView.dataSource = self
        tableView.delegate = self
        
        //init data
        dates.append("\(NSDate())")
    }
    
    //#UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dates.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        let item = dates[indexPath.row]
        
        let dateLbl = cell.viewWithTag(101) as! UILabel
        
        dateLbl.text = item
        
        return cell
    }
    
    //#Fetch
    
    func fetchNewDataWithCompletionHandler(completionHandler:(UIBackgroundFetchResult)->Void){
        NSLog("fetchNewDataWithCompletionHandler at \(NSDate())")
        
        self.dates.append("\(NSDate())")
        self.tableView.reloadData()
        
        completionHandler(UIBackgroundFetchResult.NewData)
    }
}

