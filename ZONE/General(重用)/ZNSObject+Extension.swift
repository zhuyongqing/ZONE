//
//  ZObjectExtension.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/12.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import Foundation

extension NSObject{
    
    //JSON数组转模型数组
    class func objectsWithJsons(jsons:[JSON]) -> [AnyObject]{
        
        var dicts:[[String:Any]] = [];
        for json in jsons{
            dicts.append(json.dictionaryObject!);
        }
        
        return self.objectsWithKeyValues(dicts: dicts);
    }

    //字典数组转模型数组
    class func objectsWithKeyValues(dicts:[[String:Any]]) -> [AnyObject]{
        
        var objects:[AnyObject] = [];
        
        for dict in dicts{
            
            let model = self.objectWithKeyValue(dict: dict);
            
            objects.append(model);
        }
        
        return objects;
    }
    
    //字典转模型
    class func objectWithKeyValue(dict:[String:Any]) -> AnyObject{
        
        let propertiesList:[String] = self.getAllProperties();
        let z_model = self.init();
        
        for key in propertiesList{
        
            //先判断 有没有 覆盖的属性
            let value = self.changeReplaceKey(key: key, dict: dict);
            
            if (value != nil){
                
                //如果值是字典
                if value is [String:Any]{
                    
                    self.valueIsDictModel(z_model: z_model, key: key, value: value as! [String:Any]);
                    
                }else if value is [[String:Any]]{
                    //如果是数组   数组中存放的是别的模型
                    //要实现 replaceKey方法 把数组中的模型返回出来
                    self.valueIsArrayModel(key: key, value: value as! [[String:Any]], z_model: z_model);
                    
                }else{
                    z_model.setValue(value, forKey: key);
                }
            }
            
        }
        
        return z_model;
    }
    
    //MARK: 如果值是数组 处理
    class func valueIsArrayModel(key:String,value:[[String:Any]],z_model:AnyObject) -> Void{
        //首先取出replaceKey方法中 返回的字典
        let replaceKeys = self.replaceKeyWithClass();
        for replace in Array(replaceKeys.keys){
            if replace == key{
                //如果有对应的key
                let clas:AnyClass = replaceKeys[replace]!;
                
                let models = clas.objectsWithKeyValues(dicts: value);
                
                z_model.setValue(models, forKey: key);
                
                break;
            }
            //如果不是直接赋值
            z_model.setValue(value, forKey: key);
        }
    }
    
    //MARK: 如果值是字典 处理
    class func valueIsDictModel(z_model:AnyObject,key:String,value:[String:Any]) -> Void {
        
        //是否包含了其它的类
        if  let cla = self.getClass(key: key){
            
            //给嵌套的模型赋值
            let model = cla.objectWithKeyValue(dict: value);
            
            //再赋值给当前模型
            z_model.setValue(model, forKey: key);
        }else{
            //如果当前字典不是模型
            z_model.setValue(value, forKey: key);
        }
    }
    
    //MARK: 获取所有属性
   class  func getAllProperties() -> [String] {
    
         var count: UInt32 = 0
    
        var properties:[String] = [];
    
    
        let propertyList = class_copyPropertyList(self.classForCoder(), &count);
        
        for j in 0..<numericCast(count){
            
            let prop:objc_property_t = propertyList![j]!;
            let property = property_getName(prop);
            
            properties.append(String.init(cString: property!));
        }
        
        free(propertyList);
        
        return properties;
    }
    
    //MARK: 获取类
    class func getClass(key:String) -> AnyClass?{
        
        
        var count: UInt32 = 0
        
        let propertyList = class_copyPropertyList(self.classForCoder(), &count);
        
        var cla:AnyClass?;
        
        for j in 0..<numericCast(count){
            
            let prop:objc_property_t = propertyList![j]!;
            let property = property_getName(prop);
            
            if String(cString:property!) == key {
                
                //下列步骤 最好打印下看看
                var code: NSString = NSString(cString: property_getAttributes(prop), encoding: String.Encoding.utf8.rawValue)!
                //截取字符串
                code = code.components(separatedBy: "\"")[1] as NSString
                
                //拿到工程名字
                let mainBundle = Bundle.main;
                let ex = mainBundle.object(forInfoDictionaryKey: kCFBundleExecutableKey as String);
                
                let range = code.range(of: ex as! String)
                if range.length > 0{
                    
                    //去掉前面的
                    code = code.substring(from: range.length + range.location) as NSString
                    
                    //去掉数字
                    var number:String = ""
                    for char in (code as String).characters{
                        if char <= "9" && char >= "0"{
                            number += String(char)
                        }else{
                            break
                        }
                    }
                    
                    let numberRange = code.range(of: number)
                    if numberRange.length > 0{
                        //得到类名
                        code = code.substring(from: numberRange.length + numberRange.location) as NSString
                    }
                    
                    cla = self.init().getClassWitnClassNmae(name: code as String)!;
                    
                }else{
                    return nil;
                }
            }
        }
        
        free(propertyList);
        
        return cla!;
    }
    
    //MARK: 通过类名返回一个AnyClass
    func getClassWitnClassNmae(name:String) ->AnyClass?{
        
        let mainBundle = Bundle.main;
        let ex:String = mainBundle.object(forInfoDictionaryKey: kCFBundleExecutableKey as String) as! String;
        let type = ex + "." + name
        return NSClassFromString(type)
    }
    
    //MARK: 如果实现了 更换 key的方法
    class func changeReplaceKey(key:String,dict:[String:Any]) -> Any? {
        
        //拿到方法返回的字典
        let replaces = self.replaceKeyWithString();
        
        //判断是否存在
        if let replace = replaces[key] {
            if let value = dict[replace] {
                return value;
            }
        }
        //返回默认
        return dict[key];
    }
    
    //MARK: 数组中有其它模型 要实现此方法  ["key":Model.Self]
    class func replaceKeyWithClass() -> [String:AnyClass]{
        
        return [:];
    }
    
    //MARK: 替换key 要实现此方法    ["newKey":"oldKey"]
    class func replaceKeyWithString() -> [String:String]{
        
        return [:];
        
    }

}
