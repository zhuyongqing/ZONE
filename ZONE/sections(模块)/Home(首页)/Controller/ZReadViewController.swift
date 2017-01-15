//
//  ZReadViewController.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/11.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import UIKit
import Alamofire

let cellId = "readCell";

class ZReadViewController: ZBaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!;
    var datas:[ZReadModel] = [];
    var readrequest:ZReadNetTool = ZReadNetTool();
    var requestStyle:ZBaseNetWorkStyle?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "一个阅读";
        // Do any additional setup after loading the view.
        
        self.setUpUI();
        
        self.loadNewData();
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    //MARK:导航栏
    func setUpUI() -> Void {
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: KWidth, height: KHeight - 64), style: UITableViewStyle.plain);
        tableView.backgroundColor = KMainColor;
        tableView.estimatedRowHeight = 400;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(ZReadTableCell.self, forCellReuseIdentifier: cellID);
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.mj_header = self.mj_header;
        tableView.mj_footer = self.mj_footer;
        self.view.addSubview(tableView);
    }
    
    //下拉刷新
    override func loadNewData() {
        
        self.requestStyle = ZBaseNetWorkStyle.newData;
        self.loadData();
        
    }
    
    //上拉加载
    override func loadMoreData() {
        
        self.requestStyle = ZBaseNetWorkStyle.moreData;
        self.loadData();
    }
    
    //加载数据
    func loadData() -> Void {
        
        //请求数据
        self.readrequest.loadData(resBlock: {
            [weak self] (responseModel) in
            
            if self != nil{
                
                self?.datas = responseModel.datas as! [ZReadModel];
                
                self?.tableView.reloadData();
            }
            
            self?.tableView.mj_header.endRefreshing();
            self?.tableView.mj_footer.endRefreshing();
            
        }, style: self.requestStyle!);
    }
    
    //MARK:TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ZReadTableCell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ZReadTableCell;
        
        cell.readModel = self.datas[indexPath.row];
        
        return cell;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
