//
//  ZHomeNetTool.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/12.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import UIKit

class ZHomeNetTool: ZBaseNetWorkManager {

    var datas:[ZHomeModel] = [];
    
    
    override init() {
        super.init();
        self.url = kHomeUrl;
    }
    
    override var response: JSON?{
        
        didSet{
            
            let data = response?["data"].array;
            
            let dataArray:[ZHomeModel] = ZHomeModel.objectsWithJsons(jsons: data!) as! [ZHomeModel];
            
            if self.netStyle == ZBaseNetWorkStyle.newData{
                self.datas = dataArray;
            }else{
                self.datas += dataArray;
            }
            self.responseModel?.datas = self.datas;
            
//            self.page = Int(dataArray.last!.id!);
            self.resBlock!(self.responseModel!);
        }
        
    }
    
}
