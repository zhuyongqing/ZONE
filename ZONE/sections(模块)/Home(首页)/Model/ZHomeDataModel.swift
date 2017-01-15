//
//  ZHomeDataModel.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import UIKit

class ZHomeDataModel: NSObject {
    
    func changeArrayData(data:[[String:Any]]) -> [ZHomeModel]{
        
        var allData:[ZHomeModel] = [];
        
        
        for dict in data {
            
            let home = ZHomeModel();
            home.setValuesForKeys(dict);
            
            allData.append(home);
        }
        
        return allData;
    }
    
}
