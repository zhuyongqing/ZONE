//
//  ZHomeTableCell.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/4.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

import UIKit
import AlamofireImage

class ZHomeTableCell: UITableViewCell {

    var contentLabel:UILabel?;
    var author_label:UILabel?;
     var lineView:UIView?;
    
//    var backView:UIView?;
    public var backImage:UIImageView?;
    public var homeModel:ZHomeModel?{
        
        didSet{
            
            let attr:NSMutableAttributedString = NSMutableAttributedString.init(string: (homeModel?.hp_content)!);
            
            let para = NSMutableParagraphStyle.init();
            para.lineSpacing = 5.0;
            
            attr.addAttribute(NSParagraphStyleAttributeName, value: para, range: NSMakeRange(0, (homeModel?.hp_content?.characters.count)!));
            
            self.contentLabel?.attributedText = attr;
            self.contentLabel?.sizeToFit();
            
            self.backImage?.af_setImage(withURL: NSURL.init(string: (homeModel?.hp_img_url)!) as! URL);
            self.author_label?.text = homeModel?.text_authors;
        }
        
    };
    
    public func getCellHeight() -> Void{
        
        if Int((homeModel?.cellHeight)!) > 0 {
            return;
        }
        
        layoutIfNeeded();
        
        homeModel?.cellHeight = (lineView?._bottom)!;
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.backgroundColor = KMainColor;
        
        backImage = UIImageView.init();
        backImage?.layer.shadowOffset = CGSize.init(width: 0, height: 1);
        backImage?.layer.shadowColor = UIColor.black.cgColor;
        backImage?.layer.shadowOpacity = 0.2;
        contentView.addSubview(backImage!);
        
        contentLabel = UILabel.init();
        contentLabel?.textColor = KTabbarTextColor;
        contentLabel?.font = UIFont.systemFont(ofSize: 14);
        contentLabel?.numberOfLines = 0;
        contentView.addSubview(contentLabel!);
        
        author_label = UILabel.init();
        author_label?.textColor = KTabbarNormalColor;
        author_label?.font = UIFont.systemFont(ofSize: 12);
        contentView.addSubview(author_label!);
        
        lineView = UIView.init();
        lineView?.backgroundColor = KGroyColor;
        contentView.addSubview(lineView!);
        
        let kImageMargin = 40;
        
        //布局
        let backImageV = self.backImage!;
        let imageW = KWidth;
        let imageH = KWidth * 250/375;
        backImageV.snp.makeConstraints({ (make) in
            
            make.top.equalTo(contentView).offset(0);
            make.centerX.equalTo(contentView);
            make.width.equalTo(imageW);
            make.height.equalTo(imageH);
        })
        
        let content = contentLabel!;
        content.snp.makeConstraints { (make) in
            
            make.top.equalTo(backImageV.snp.bottom).offset(kImageMargin);
            make.centerX.equalTo(backImageV);
            make.width.equalTo(kImageW);
        }
        
        let author = author_label!;
        author.snp.makeConstraints { (make) in
            
            make.top.equalTo(content.snp.bottom).offset(kImageMargin);
            make.centerX.equalTo(content);
            make.height.equalTo(13);
        }
        
        let line = lineView!;
        line.snp.makeConstraints { (make) in
            make.top.equalTo(author.snp.bottom).offset(kImageMargin/2);
            make.width.equalTo(KWidth);
            make.height.equalTo(10);
            make.centerX.equalTo(content);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
