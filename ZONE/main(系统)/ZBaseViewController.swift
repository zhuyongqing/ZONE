//
//  ZBaseViewController.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import UIKit

class ZBaseViewController: UIViewController {

    lazy var mj_header:MJRefreshNormalHeader = {
        
        let header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(ZBaseViewController.loadNewData));
        
        return header!;

    }();

    
    lazy var mj_footer:MJRefreshAutoNormalFooter = {
       
        let footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(ZBaseViewController.loadMoreData));
        
        return footer!;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view.
    }

    func loadNewData() -> Void {
        
    }
    
    func loadMoreData() -> Void {
        
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
