//
//  CommentCell.h
//  WXMovie
//
//  Created by wei.chen on 14-1-21.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kContentWidth 260

@class CommentModel;
@interface CommentCell : UITableViewCell {
    
    IBOutlet UIImageView *userImage;
    IBOutlet UIImageView *bjView;
    IBOutlet UILabel *nickLabel;
    IBOutlet UILabel *ratingLabel;
    IBOutlet UILabel *contentLabel;
}

@property(nonatomic,retain)CommentModel *comment;

//计算单元格的高度
//+ (CGFloat)cellHeight:(NSString *)content;

@end
