//
//  ZReadModel.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/11.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import UIKit

class ZReadModel: NSObject {

    
    var audio_url:String?;
    var ad_id:NSNumber?;
    var movie_story_id:NSNumber?;
    var forward:String?;
    var ad_pvurl:String?;
    var author:ZAuthorModel?;
    var category:String?;
    var content_type:String?;
    var last_update_date:String?;
    var like_count:NSNumber?;
    var ad_linkurl:String?;
    var video_url:String?;
    var id:String?;
    var ad_makettime:String?;
    var post_date:String?;
    var subtitle:String?;
    var item_id:String?;
    var serial_id:NSNumber?;
    var content_id:String?;
    var start_video:String?;
    var img_url:String?;
    var titl:String?;
    var content_bgcolor:String?;
    var share_info:[String:Any]?;
    var ad_share_cnt:String?;
    var display_category:String?;
    var ad_closetime:String?;
    var share_url:String?;
    var words_info:String?;
    var number:NSNumber?;
    var volume:NSNumber?;
    var ad_pvurl_vendor:String?;
    var ad_type:NSNumber?;
    var audio_platform:NSNumber?;
    var serial_list:[String]?;
    var pic_info:String?;
    var tag_list:[String]?;
    var authos:[ZAuthorModel]?;
    var cellHeight:CGFloat = 0;
    
    public func getCellHeight() -> (){
        
        
        
    }
    
    
    override class func replaceKeyWithClass() -> [String:AnyClass]{
        
        return ["authos":ZAuthorModel.self,"titles":ZHomeModel.self];
    }
    
    
    override class func replaceKeyWithString() -> [String:String]{
        
        return ["titl":"title"];
        
    }
    
    
}
