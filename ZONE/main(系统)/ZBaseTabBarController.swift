//
//  ZBaseTabBarController.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/27.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import UIKit

class ZBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBar.isTranslucent = false;
        self.tabBar.barTintColor = KMainColor;
        self.tabBar.backgroundImage = UIImage();
        self.tabBar.shadowImage = UIImage();
        self.tabBar.layer.shadowOpacity = 0.1;
        self.tabBar.layer.shadowOffset = CGSize.init(width: 1, height: -2);
        self.tabBar.layer.shadowColor = UIColor.black.cgColor;
        
        
        let imageNames = ["tabbar_home","tabbar_read"];
        let titles = ["首页","阅读"];
        
        
        //首页
        let home = ZHomeViewController.init();
        let homeNavi = self.setChildController(title: titles[self.getIndex()], image: self.setUpImageRender(imageName: imageNames[self.getIndex()]), selectedImage: self.setUpSelectImageRender(imageName:imageNames[self.getIndex()]), vc: home);
        self.addChildViewController(homeNavi);
            
        //阅读
        let read = ZReadViewController.init();
        let readNavi = self.setChildController(title: titles[self.getIndex()], image: self.setUpImageRender(imageName: imageNames[self.getIndex()]), selectedImage: self.setUpSelectImageRender(imageName: imageNames[self.getIndex()]), vc: read);
        self.addChildViewController(readNavi);
  
    }

    func setChildController(title:String,image:UIImage,selectedImage:UIImage,vc:UIViewController) -> UINavigationController {
        
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = image.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        vc.tabBarItem.selectedImage = selectedImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:KTabbarTextColor], for: UIControlState.selected);
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:KTabbarNormalColor], for: UIControlState.normal);
        
        let navi = ZBaseNavigationController.init(rootViewController:vc);
        
        return navi;
        
    }
    
    func getIndex() -> NSInteger {
        return self.childViewControllers.count;
    }
    
    func setUpImageRender(imageName:String) -> UIImage {
        return (UIImage.init(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))!;
    }
    
    func setUpSelectImageRender(imageName:String) -> UIImage {
        return (UIImage.init(named: imageName + "_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))!;
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
