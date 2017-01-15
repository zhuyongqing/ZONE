//
//  ZReadNetTool.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/11.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import UIKit

class ZReadNetTool: ZBaseNetWorkManager {
    
    var datas:[ZReadModel] = [];
    
    
    override init() {
        super.init();
        self.url = kReadUrl;
    }
    
    override var response: JSON?{
        
        didSet{
            
            //拿到返回的json
            let data = response?["data"].array;
        
            //转成模型数组
            let dataArray:[ZReadModel] = ZReadModel.objectsWithJsons(jsons: data!) as! [ZReadModel];
            
            
            if self.netStyle == ZBaseNetWorkStyle.newData{
                self.datas = dataArray;
            }else{
                self.datas += dataArray;
            }
            self.responseModel?.datas = self.datas;
            
            self.page = Int(dataArray.last!.id!);
            self.resBlock!(self.responseModel!);
        }
        
    }
}
