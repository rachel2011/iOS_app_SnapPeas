//
//  HCell.h
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *hTableView;
    NSArray *items;
}
-(UINavigationController *) parentTableView;
@property (nonatomic,retain) UITableView *hTableView;
@property (nonatomic,retain) NSArray *items;
@property (nonatomic,retain) NSString *rowType;
@property(nonatomic,strong) NSArray * recipeArray;
@property(nonatomic,strong) NSArray * purchaseArray;
- (void) reloadData;
@end
