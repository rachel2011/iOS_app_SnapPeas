//
//  EditUserView.m
//  SnapPeas
//
//  Created by Ren Zhou on 15／7/28.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import "EditUserView.h"
#import "FMDBManager.h"


@interface EditUserView ()

@end

@implementation EditUserView
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.flag = [myData objectAtIndex:0];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setButtonStyle];
    [self showContent];
    self.updataBt.layer.cornerRadius = 15;
    self.updataBt.layer.borderWidth = 1;
    self.updataBt.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.updataBt.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.cancelBt.layer.cornerRadius = 15;
    self.cancelBt.layer.borderWidth = 1;
    self.cancelBt.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.cancelBt.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
}
#pragma mark
- (void) setButtonStyle{
    
    
    self.updataBt.layer.borderWidth=1;
    self.updataBt.layer.cornerRadius=5;
    self.updataBt.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    
    self.cancelBt.layer.borderWidth=1;
    self.cancelBt.layer.cornerRadius=5;
    self.cancelBt.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    
}

#pragma mark
- (void) showContent{
    self.ageLabel.text=[NSString stringWithFormat:@"%ld",self.user.age];
    self.goalLabel.text=self.user.goals;
    self.allerLabel.text=self.user.allergy;
    
    self.ageLabel.enabled=NO;
    self.goalLabel.enabled=NO;
    self.allerLabel.enabled=NO;
    
    
    
    if([self.flag isEqual:@"100"]){
        self.ageLabel.enabled=YES;
        self.ageT.hidden=NO;
    }else if([self.flag isEqual:@"101"]){
        self.allerLabel.enabled=YES;
        self.alleT.hidden=NO;
    }else{
        self.goalLabel.enabled=YES;
        self.goalT.hidden=NO;
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.ageLabel resignFirstResponder];
    [self.allerLabel resignFirstResponder];
    [self.goalLabel resignFirstResponder];
    
}


#pragma mark
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==1){
        
        NSString * str=nil;
        
        
        if([self.flag isEqual:@"100"]){
            str=[NSString stringWithFormat:@"age=%ld",[self.ageLabel.text integerValue]];
            
        }else if([self.flag isEqual:@"101"]){
            str=[NSString stringWithFormat:@"allergy='%@'",self.allerLabel.text];
            
        }else{
            str=[NSString stringWithFormat:@"goals1='%@'",self.goalLabel.text];
        }
        
        NSString * sql=[NSString stringWithFormat:@"update Users set %@ where UserID=%ld",str,self.user.userId];
        
        [FMDBManager executeUpdateWithSql:sql andTips:@"update information"];
        [self.navigationController popViewControllerAnimated:YES];

        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushUpdateButton:(id)sender {
    UIAlertView * alert=[[UIAlertView alloc] initWithTitle:nil message:@"Are you sure to update the data?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"YES", nil];
    [alert show];
}
- (IBAction)pushCancelButton:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
