//
//  ViewController.swift
//  MyPullToRefresh
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private static let ReusableIdentifier = "reuseCell"
    
    private lazy var tableView:UITableView! =  {
        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
//        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.ReusableIdentifier)
        self.view.addSubview(tableView)
        return tableView
    }()
    
    private lazy var refreshControl:UIRefreshControl! = {
        let refreshControl = UIRefreshControl.init()
        refreshControl.addTarget(self, action: #selector(headRefresh), for: UIControlEvents.valueChanged)
        refreshControl.backgroundColor = UIColor.lightGray
        refreshControl.attributedTitle = NSAttributedString.init(string: "last updata on \(NSDate.init())", attributes:[NSAttributedStringKey.foregroundColor:UIColor.red])
        refreshControl.tintColor = UIColor.white
        return refreshControl
    }()
    
    var feedEntity:Array<String> = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.tableView.refreshControl = refreshControl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedEntity.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.ReusableIdentifier, for: indexPath)
        cell.textLabel?.text = feedEntity[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    @objc func headRefresh() {
        defer {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
        
        feedEntity = feedEntity + ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸"]
        
    }
}

