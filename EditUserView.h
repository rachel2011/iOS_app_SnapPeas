//
//  EditUserView.h
//  SnapPeas
//
//  Created by Ren Zhou on 15/7/28.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"



@interface EditUserView : UIViewController
@property(nonatomic,retain) NSString *flag;


@property(nonatomic,strong) User * user;



@property (weak, nonatomic) IBOutlet UITextField *ageLabel;
@property (weak, nonatomic) IBOutlet UITextField *allerLabel;
@property (weak, nonatomic) IBOutlet UITextField *goalLabel;


@property (weak, nonatomic) IBOutlet UILabel *ageT;
@property (weak, nonatomic) IBOutlet UILabel *alleT;
@property (weak, nonatomic) IBOutlet UILabel *goalT;
@property (strong, nonatomic) IBOutlet UIButton *updataBt;
@property (strong, nonatomic) IBOutlet UIButton *cancelBt;
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData;
@end
