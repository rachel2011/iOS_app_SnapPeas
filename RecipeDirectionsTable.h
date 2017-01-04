//
//  RecipeDirectionsTable.h
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RecipeDirectionsTable : UITableViewController

@property(nonatomic,strong) NSArray * array;
@property (nonatomic, retain) NSString *passedName;
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData;
@end
