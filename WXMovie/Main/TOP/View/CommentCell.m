//
//  CommentCell.m
//  WXMovie
//
//  Created by wei.chen on 14-1-21.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "CommentCell.h"
#import "CommentModel.h"

@implementation CommentCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];

}

- (void)setComment:(CommentModel *)comment {
    if (_comment != comment) {
        _comment = comment;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    contentLabel.width = kContentWidth;
    
    NSString *urlstring = self.comment.userImage;
    [userImage setImageWithURL:[NSURL URLWithString:urlstring]];
    userImage.layer.borderWidth = 1;
    userImage.layer.borderColor = [UIColor whiteColor].CGColor;
    
    nickLabel.text = self.comment.nickname;
    ratingLabel.text = self.comment.rating;
    contentLabel.text = self.comment.content;

    //调整背景视图与内容Label的高度
    bjView.height = self.height - 10;
    contentLabel.height = self.height - 40;
    
    UIImage *resizeImg = [bjView.image stretchableImageWithLeftCapWidth:0 topCapHeight:10];
    bjView.image = resizeImg;
}


@end
