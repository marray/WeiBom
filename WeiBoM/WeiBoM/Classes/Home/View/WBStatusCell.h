//
//  WBStatusCell.h
//  WeiBoM
//
//  Created by Michael on 10/22/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBStatusFrame;

@interface WBStatusCell : UITableViewCell
+(instancetype)cellwithTableView:(UITableView *)tableView;

/**微博数据模型*/
@property(nonatomic,strong) WBStatusFrame *statusFrame;

@end
