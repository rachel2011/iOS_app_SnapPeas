//
//  MainScreen.h
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScreen : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSDictionary *itemDict;
}
@property (nonatomic,retain) NSDictionary *itemDict;
-(void)rightBarButtonPushed;

@end
