//
//  ZHomeViewController.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import UIKit
import Alamofire


let cellID = "HOMECELLID";


class ZHomeViewController: ZBaseViewController,UITableViewDelegate,UITableViewDataSource {

    var collectionView:UICollectionView?;
    var datas:[ZHomeModel] = [];
    var tableView:UITableView?;
    var request:ZHomeNetTool = ZHomeNetTool();
    var requestStyle:ZBaseNetWorkStyle?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "ONE";
        view.backgroundColor = KMainColor;
        
        self.setUpUI();
        
        self.loadNewData();
        
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
        self.request.loadData(resBlock: {
            [weak self] (responseModel) in
            
            self?.datas = responseModel.datas as! [ZHomeModel];
            self?.tableView?.reloadData();
            
            self?.tableView?.mj_header.endRefreshing();
            self?.tableView?.mj_footer.endRefreshing();
            
        }, style: self.requestStyle!);
        
    }
    
    //布局
    func setUpUI() -> Void {
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: KWidth, height: KHeight - 94), style: UITableViewStyle.plain);
        self.tableView?.backgroundColor = KGroyColor;
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView?.estimatedRowHeight = 400;
        self.tableView?.mj_footer = self.mj_footer;
        self.tableView?.mj_header = self.mj_header;
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.tableView?.register(ZHomeTableCell.self, forCellReuseIdentifier: cellID);
        self.view.addSubview(self.tableView!);
        
    }
    
    //MARK:TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var cell:ZHomeTableCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? ZHomeTableCell;
        if cell == nil {
            cell = ZHomeTableCell.init(style: .default, reuseIdentifier: cellID);
        }
        cell?.homeModel = self.datas[indexPath.row];
        cell?.getCellHeight();
        
        return (cell?.homeModel?.cellHeight)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ZHomeTableCell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ZHomeTableCell;
        cell.homeModel = self.datas[indexPath.row];
        return cell;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
