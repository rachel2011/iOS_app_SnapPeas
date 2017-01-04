//
//  UserDetailView.h
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface UserDetailView : UIViewController


@property (weak, nonatomic) IBOutlet UIBarButtonItem *accountInfo;
@property (weak, nonatomic) IBOutlet UILabel *ageInfo;
@property (weak, nonatomic) IBOutlet UILabel *allerInfo;
@property (weak, nonatomic) IBOutlet UILabel *goalsInfo;

@property(nonatomic,strong) User * user;
@property (weak, nonatomic) IBOutlet UIButton *ageBt;
@property (weak, nonatomic) IBOutlet UIButton *allerBt;
@property (weak, nonatomic) IBOutlet UIButton *goalBt;

@property (weak, nonatomic) IBOutlet UIProgressView *progress;
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData;
@end
