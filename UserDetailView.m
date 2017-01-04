//
//  UserDetailView.m
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "UserDetailView.h"
#import "FMDBManager.h"
#import "EditUserView.h"

@interface UserDetailView ()
//$(PROJECT_DIR)/build/Debug-iphoneos
@end

@implementation UserDetailView
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.accountInfo.title=self.user.displayName;
    [self loadData];
    [self setUpButtons];
}
- (void) loadData{
    
}


#pragma mark
- (void)setUpButtons{
    
    
    self.ageBt.layer.borderWidth=1;
    self.ageBt.layer.cornerRadius=5;
    self.ageBt.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    
    self.allerBt.layer.borderWidth=1;
    self.allerBt.layer.cornerRadius=5;
    self.allerBt.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    
    
    self.goalBt.layer.borderWidth=1;
    self.goalBt.layer.cornerRadius=5;
    self.goalBt.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    self.ageBt.layer.cornerRadius = 15;
    self.ageBt.layer.borderWidth = 1;
    self.ageBt.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.ageBt.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.allerBt.layer.cornerRadius = 15;
    self.allerBt.layer.borderWidth = 1;
    self.allerBt.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.allerBt.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.goalBt.layer.cornerRadius = 15;
    self.goalBt.layer.borderWidth = 1;
    self.goalBt.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.goalBt.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
    //设置人员信息
    self.ageInfo.text=[NSString stringWithFormat:@"%ld",self.user.age];
    self.allerInfo.text=self.user.allergy;
    self.goalsInfo.text=self.user.goals;
    
    NSArray * scoreArray=[self.user.goals componentsSeparatedByString:@"#"];
    
    NSInteger low=[[scoreArray firstObject] integerValue];
    
    NSInteger max=[[scoreArray firstObject] integerValue];
    
    NSInteger total=0;
    
    
    for (NSString * str in scoreArray) {
        
        total+=[str integerValue];
        
        if ([str integerValue]<low) {
            low=[str integerValue];
        }
        
        if ([str integerValue]>max) {
            max=[str integerValue];
        }
        
    }
    
    
    [UIView animateWithDuration:1 animations:^{
        self.progress.progress=total*1.0/scoreArray.count/max;
    }];
    
    
}
- (IBAction)editButtonPush:(id)sender {
    NSArray *arr = [NSArray arrayWithObject:@"100"];
    EditUserView *nextV = [[EditUserView alloc]initWithData:@"EditUserView" bundle:nil data:arr];
    nextV.user=self.user;
    [self.navigationController pushViewController:nextV animated:YES];
}
- (IBAction)alergButtonPush:(id)sender {
    NSArray *arr = [NSArray arrayWithObject:@"101"];
    EditUserView *nextV = [[EditUserView alloc]initWithData:@"EditUserView" bundle:nil data:arr];
        nextV.user=self.user;
    [self.navigationController pushViewController:nextV animated:YES];
    
}
- (IBAction)goalsButtonPush:(id)sender {
    NSArray *arr = [NSArray arrayWithObject:@"102"];
    EditUserView *nextV = [[EditUserView alloc]initWithData:@"EditUserView" bundle:nil data:arr];
        nextV.user=self.user;
    [self.navigationController pushViewController:nextV animated:YES];
    
}


#pragma mark - 重写加载数据
-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    //查询数据库
    NSString *userid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString * sql=@"select  * from Users  ";
    sql=[NSString stringWithFormat:sql,userid ];
    NSArray * array=[FMDBManager queryDataWithSql:sql];
    
    //将查询的数据插入数组
    NSDictionary * dic =[array firstObject];
    User * user=[User getUserByDic:dic];
    self.user=user;
    
    //设置条属性
    self.progress.progress=0;
    self.progress.transform=CGAffineTransformMakeScale(1, 3);
    
    
    
}

@end
