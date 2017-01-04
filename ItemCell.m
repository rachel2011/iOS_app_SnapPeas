//
//  ItemCell.m
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "ItemCell.h"
#import "ConstantVars.h"

@implementation ItemCell
@synthesize pic;
@synthesize title;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [self initWithFrame:self.frame];
    return self;
    
}
- (id)initWithFrame:(CGRect)frame
{
    //self = [super initWithFrame:frame];
    
    /*self.pic = [[UIImageView alloc] initWithFrame:CGRectMake(kArticleCellHorizontalInnerPadding, kArticleCellVerticalInnerPadding, kCellWidth - kArticleCellHorizontalInnerPadding * 2, kCellHeight - kArticleCellVerticalInnerPadding * 2)];
    self.pic.opaque = YES;
    
    [self.contentView addSubview:self.pic];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, self.pic.frame.size.height * 0.632, self.pic.frame.size.width, self.pic.frame.size.height * 0.37)];
    self.title.opaque = YES;
    self.title.backgroundColor = [UIColor colorWithRed:0 green:0.4745098 blue:0.29019808 alpha:0.9];
    self.title.textColor = [UIColor blackColor];
    self.title.font = [UIFont boldSystemFontOfSize:11];
    self.title.numberOfLines = 2;
    [self.title setTextAlignment:NSTextAlignmentCenter];
    [self.pic addSubview:self.title];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0.40784314 blue:0.21568627 alpha:1.0];
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.pic.frame];
    self.selectedBackgroundView.backgroundColor = kHorizontalTableSelectedBackgroundColor;
    
    self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    return self;*/
    self.pic = [[UIImageView alloc] initWithFrame:CGRectMake(kArticleCellHorizontalInnerPadding, kArticleCellVerticalInnerPadding, kCellWidth - kArticleCellHorizontalInnerPadding * 2, kCellHeight - kArticleCellVerticalInnerPadding * 2)];
    self.pic.opaque = YES;
    
    [self.contentView addSubview:self.pic];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(self.pic.frame.size.width*.1, self.pic.frame.size.height * 0.7, self.pic.frame.size.width*.8, self.pic.frame.size.height * 0.25)];
    self.title.opaque = YES;
    self.title.backgroundColor = [UIColor colorWithRed:0 green:0.4745098 blue:0.29019808 alpha:0.9];
    self.title.textColor = [UIColor blackColor];
    self.title.font = [UIFont boldSystemFontOfSize:11];
    self.title.numberOfLines = 2;
    [self.title setTextAlignment:NSTextAlignmentCenter];
    [self.pic addSubview:self.title];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0.40784314 blue:0.21568627 alpha:1.0];
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.pic.frame];
    self.selectedBackgroundView.backgroundColor = kHorizontalTableSelectedBackgroundColor;
    
    self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    return self;
    
    
    
}
@end
