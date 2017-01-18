//
//  ZReadTableCell.swift
//  ZONE
//
//  Created by zhuyongqing on 2017/1/11.
//  Copyright © 2017年 zhuyongqing. All rights reserved.
//

//阅读cell

import UIKit
import SnapKit
import AlamofireImage


let kMargin = 10;
let kImageW = 295/376 * KWidth;
let kImageH = 188/295 * kImageW;

class ZReadTableCell: UITableViewCell {

    var style_label:UILabel!;
    var title_label:UILabel!;
    var author_label:UILabel!;
    var line_view:UIView!;
    var content_label:UILabel!;
    var readImage_imageV:UIImageView!;
    var bottomLine_view:UIView!;
    public var cellHeight:CGFloat?;
    
    public var readModel:ZReadModel?{
        
        didSet{
            
            style_label.text = "- 阅读 -"
            
            title_label.text = readModel?.titl;
//            let authors:[String:Any] = (readModel?.author)!;
//            let authorName:String = authors["user_name"] as! String;
            
            
            
            author_label.text = "文 / " + (readModel?.author?.user_name)!;
            
            let attr:NSMutableAttributedString = NSMutableAttributedString.init(string: (readModel?.forward)!);
            
            let para = NSMutableParagraphStyle.init();
            para.lineSpacing = 5.0;
            
            attr.addAttribute(NSParagraphStyleAttributeName, value: para, range: NSMakeRange(0, (readModel?.forward?.characters.count)!));
            
//            let nsStr = (readModel?.forward)! as NSString;
//            let rect =  nsStr.boundingRect(with: CGSize.init(width: kImageW, height: 300), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSParagraphStyleAttributeName:para], context: nil);
            
            
            content_label.attributedText = attr;
            content_label.sizeToFit();
            
            readImage_imageV.af_setImage(withURL: NSURL.init(string: (readModel?.img_url)!) as! URL);
            
        }
        
    }
    
    //获取cell的高度
    public func getCellHeight() -> Void{
        
        if ( Int((readModel?.cellHeight)!) > 0) {
            return;
        }
        layoutIfNeeded();
        
        readModel?.cellHeight = bottomLine_view._bottom;
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //类型
        style_label = UILabel.init();
        style_label.font = UIFont.systemFont(ofSize: 12);
        style_label.textColor = KTabbarNormalColor;
        contentView.addSubview(style_label);
        
        //标题
        title_label = UILabel.init();
        title_label.font = UIFont.systemFont(ofSize: 20);
        title_label.textColor = UIColor.black;
        title_label.numberOfLines = 0;
        contentView.addSubview(title_label);
        
        //线
        line_view = UIView.init();
        line_view.backgroundColor = UIColor.black;
        contentView.addSubview(line_view);
        
        //作者
        author_label = UILabel.init();
        author_label.font = UIFont.systemFont(ofSize: 15);
        author_label.textColor = UIColor.black;
        contentView.addSubview(author_label);
        
        //内容
        content_label = UILabel.init();
        content_label.font = UIFont.systemFont(ofSize: 14);
        content_label.textColor = KTabbarNormalColor;
        content_label.numberOfLines = 0;
        contentView.addSubview(content_label);
        
        //图片
        readImage_imageV = UIImageView.init();
        readImage_imageV.layer.shadowColor = UIColor.black.cgColor;
        readImage_imageV.layer.shadowOffset = CGSize.init(width: 1, height: 1);
        readImage_imageV.layer.shadowOpacity = 0.2;
        contentView.addSubview(readImage_imageV);
        
        //底部线
        bottomLine_view = UIView.init();
        bottomLine_view.backgroundColor = KGroyColor;
        contentView.addSubview(bottomLine_view);
        
        //布局
        
        let styles = style_label!;
        styles.snp.makeConstraints({ (make) in
            
            make.top.equalTo(contentView).offset(kMargin);
            make.centerX.equalTo(contentView);
            make.height.equalTo(13);
        })
        
        
        let title = title_label!;
        title.snp.makeConstraints { (make) in
            
            make.top.equalTo(styles.snp.bottom).offset(kMargin*2)
            make.width.equalTo(kImageW);
            make.centerX.equalTo(styles);
        }
        
        let line = line_view!;
        line.snp.makeConstraints { (make) in
            
            make.top.equalTo(title.snp.bottom).offset(20);
            make.left.equalTo(title).offset(5);
            make.width.equalTo(100);
            make.height.equalTo(4);
        }
        
        let author = author_label!;
        
        author.snp.makeConstraints { (make) in
            
            make.top.equalTo(line.snp.bottom).offset(20);
            make.left.equalTo(line);
            make.height.equalTo(16);
            make.right.equalTo(contentView.snp.right).offset(-kMargin);
        }
        
        let content = content_label!;
        
        content.snp.makeConstraints { (make) in
            
            make.top.equalTo(author.snp.bottom).offset(20);
            make.left.equalTo(title);
            make.width.equalTo(kImageW);
        }
        content_label.preferredMaxLayoutWidth = kImageW;
        
        let imageV = readImage_imageV!;
        
        imageV.snp.makeConstraints { (make) in
            
            make.top.equalTo(content.snp.bottom).offset(40);
            make.width.equalTo(kImageW);
            make.height.equalTo(kImageH);
            make.centerX.equalTo(content);
        }
        
        let bottomLine = bottomLine_view!;
        bottomLine.snp.makeConstraints { (make) in
            
            make.top.equalTo(imageV.snp.bottom).offset(40);
            make.width.equalTo(KWidth);
            make.left.equalTo(0);
            make.height.equalTo(kMargin);
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
