//
//  ZModelKeys.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import Foundation

extension NSObject{
    
   public func getAllKeys(dict:[String:Any]) -> Void {
        
        var str:String = "";
        for keys in Array(dict.keys) {
            let value = dict[keys];
            if value is NSNumber {
                str = str.appending("var " + keys + ":NSNumber?;" + "\n");
            }else if value is [String]{
                str = str.appending("var" + keys + " :[String]?;" + "\n");
            }else if value is [String:Any]{
                str = str.appending("var" + keys + " :[String:Any]?;" + "\n");
            }else{
                str = str.appending("var " + keys + " :String?;" + "\n");
            }
        }
        print(str);
    }
}
