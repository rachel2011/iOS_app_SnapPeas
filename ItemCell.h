//
//  ItemCell.h
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell
{
    UIImageView *pic;
    UILabel *title;
}
@property (nonatomic,retain) UIImageView *pic;
@property (nonatomic,retain) UILabel *title;
@end
