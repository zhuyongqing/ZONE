//
//  ZBaseNavigationController.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import UIKit

class ZBaseNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20),NSForegroundColorAttributeName:KNaviTitleColor];
        self.navigationBar.isTranslucent = false;
        
        self.navigationBar.barTintColor = KMainColor;
        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default);
        self.navigationBar.shadowImage = UIImage();
        
        self.navigationBar.layer.shadowColor = UIColor.black.cgColor;
        self.navigationBar.layer.shadowOffset = CGSize.init(width: 1, height: 2);
        self.navigationBar.layer.shadowOpacity = 0.1;
        
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
