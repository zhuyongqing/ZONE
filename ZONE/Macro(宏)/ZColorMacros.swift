//
//  ZColorMacros.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import Foundation
import UIKit

func RGB(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor{
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a);
}

let KarcRandomColor = UIColor.init(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0), green: CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue: CGFloat(arc4random_uniform(255))/CGFloat(255.0), alpha: 1);

let KMainColor = RGB(r: 254,g: 254,b: 254,a: 1);

let KNaviTitleColor = RGB(r: 63,g: 81,b: 99,a: 1);

let KMainTextColor = RGB(r: 90,g: 90,b: 90,a: 1);

let KNaviLineColor = RGB(r: 216,g: 216,b: 216,a: 1);

let KMainGroyColor = RGB(r: 180,g: 180,b: 180,a: 1);

let KGroyColor = RGB(r:235,g:235,b: 235,a: 1);

let KTabbarTextColor = RGB(r:121,g: 120,b: 121,a: 1);

let KTabbarNormalColor = RGB(r:161,g: 161,b: 161,a: 1);



		
