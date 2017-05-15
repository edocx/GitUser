//
//  MovieHeaderView.h
//  WXMovie
//
//  Created by wei.chen on 14-1-21.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieDetailModel;
@interface MovieHeaderView : UIView {
    
    IBOutlet UIImageView *movieImg;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *directorLabel;
    IBOutlet UILabel *actorLabel;
    IBOutlet UILabel *typeLabel;
    IBOutlet UILabel *releaseLabel;
    IBOutlet UIView *imgView;
    
    __weak IBOutlet UIImageView *imagr;
    NSMutableArray *imgs;
}

@property(nonatomic,retain)MovieDetailModel *movieDetail;

@end
