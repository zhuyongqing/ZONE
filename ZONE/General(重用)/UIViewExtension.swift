//
//  UIViewExtension.swift
//  ZONE
//
//  Created by zhuyongqing on 2016/12/28.
//  Copyright © 2016年 zhuyongqing. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    public var _x:CGFloat{
        
        get{
            
            return self.frame.origin.x;
            
        }set{
            var origin = self.frame.origin;
            origin.x = _x;
            self.frame.origin = origin;
        }
    };
    
    public var _y:CGFloat{
        
        get{
            
            return self.frame.origin.y;
        }
        
        set{
            
            var origin = self.frame.origin;
            origin.y = _y;
            self.frame.origin = origin;
            
        }
    }
    
    public var _width:CGFloat{
      
        get{
            return self.frame.size.width;
        }
        set{
            
            var size = self.frame.size;
            size.width = _width;
            self.frame.size = size;
        }
    };
    
    public var _height:CGFloat{
        get{
            
            return self.frame.size.height;
            
        }
        set{
            var size = self.frame.size;
            size.height = _height;
            self.frame.size = size;
        }
    };
    
    public var _left:CGFloat{
        
        get{
            return self.frame.origin.x;
        }
        set{
            var origin = self.frame.origin;
            origin.x = _left;
            self.frame.origin = origin;
        }
    }
    
    public var _right:CGFloat{
        
        get{
            
            return self.frame.origin.x + self.frame.width;
        }
        
        set{
            var origin = self.frame.origin;
            origin.x = _right - self.frame.width;
            self.frame.origin = origin;
        }
    }
    
    public var _top:CGFloat{
        
        get{
            return self.frame.origin.y;
        }
        set{
            var origin = self.frame.origin;
            origin.y = _top;
            self.frame.origin = origin;
        }
    }
    
    public var _bottom:CGFloat{
        get{
            return self.frame.origin.y + self.frame.height;
        }
        set{
            var origin = self.frame.origin;
            origin.y = _bottom - self.frame.height;
            self.frame.origin = origin;
        }
    }
    
}

