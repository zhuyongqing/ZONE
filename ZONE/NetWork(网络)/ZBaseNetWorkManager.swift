//
//  ZBaseNetWorkManager.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/11.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import UIKit
import Alamofire

public enum ZBaseNetWorkStyle : Int {
    
    
    case newData // 下拉刷新
    
    case moreData // 上拉加载
}

class ZBaseNetWorkManager: NSObject {

    var url:String!;
    var page:Int?;
    var responseModel:ZResposeModel?;
    var resBlock:((_ response:ZResposeModel)->Void)?;
    var response:JSON?;
    var netStyle:ZBaseNetWorkStyle?;
    
    //加载数据
    public func loadData() -> Void {
        
        responseModel = ZResposeModel();
        responseModel?.url = self.url;
        responseModel?.page = self.page;
        
        //请求链接
        let resquest = kBaseUrl + self.url + "\(self.page!)";
        
        Alamofire.request(resquest).responseJSON { (response) in
            
            if let json = response.result.value{
                
                self.response = JSON(json);
                
            }
        }
    }
    
    //上拉 下拉 情况
    func loadData(resBlock:@escaping ((_ responseModel:ZResposeModel) -> Void),style:ZBaseNetWorkStyle) -> Void{
        
        self.resBlock = resBlock;
        self.netStyle = style;
        
        if style == ZBaseNetWorkStyle.newData {
            self.page = 0;
        }
        self.loadData();
    }
}
