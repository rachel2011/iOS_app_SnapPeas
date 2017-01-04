//
//  FoodDetailView.m
//  SnapPeas
//
//  Created by Labuser on 7/15/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "FoodDetailView.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface FoodDetailView ()

@property(nonatomic,strong) MBProgressHUD * hud;



@end

@implementation FoodDetailView
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData
{
    
    UIWindow * window=[UIApplication sharedApplication].keyWindow;
    self.hud=[MBProgressHUD showHUDAddedTo:window animated:YES];
    self.hud.dimBackground=YES;
    self.hud.labelText=@"I am fighting to load now !";
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 
    
    //self.foodPic.image = [[UIImage alloc] initWithData:data];
    //self.foodPic.image = [myData objectAtIndex:1];
    //self.foodName.text = [myData objectAtIndex:0];
    self.passedName = self.detail.name;
//    self.detail=self.food.food_name;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *datas = [NSData dataWithContentsOfURL:[NSURL URLWithString: self.detail.url ]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
           self.passedPic = [[UIImage alloc] initWithData:datas];
           self.hud.hidden=YES;
          self.foodPic.image=self.passedPic;
            
        });
    });
    
    
//    self.hud.hidden=YES;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.foodName.text = self.passedName;
    //self.foodPic.image = self.passedPic;
    
    int a=arc4random_uniform(4);
    DetailInfo * d1=self.foodArray[a];
    
    if (a==4) {
        a=0;
    }else{
        a++;
    }
    
    DetailInfo * d2=self.foodArray[a];
    
    if (a==4) {
        a=0;
    }else{
        a++;
    }
    DetailInfo * d3=self.foodArray[a];
    

    self.suggestionNameOne.text = d1.name;
    NSURL *url = [NSURL URLWithString:d1.url];
//    NSData *data = [NSData dataWithContentsOfURL:url];
    [self.suggestionOne setImageWithURL:url placeholderImage:nil];
    self.suggestionNameTwo.text = d2.name;
    NSURL *url2 = [NSURL URLWithString:d2.url];
//    NSData *data2 = [NSData dataWithContentsOfURL:url2];
    [self.suggestionTwo setImageWithURL:url2 placeholderImage:nil];
//    self.suggestionTwo.image = [[UIImage alloc] initWithData:data2];
    self.suggestionNameThree.text = d3.name;
    NSURL *url3 = [NSURL URLWithString:d3.url];
    [self.suggestionThree setImageWithURL:url3 placeholderImage:nil];
//    NSData *data3 = [NSData dataWithContentsOfURL:url3];
//    self.suggestionThree.image = [[UIImage alloc] initWithData:data3];
    // Do any additional setup after loading the view from its nib.
    self.nutritionOne.text = [NSString stringWithFormat:@"Servings: %@",self.detail.serving];
    self.nutritionOne.textColor = [UIColor greenColor];
    self.nutritionTwo.text =  [NSString stringWithFormat:@"Calories: %@",self.detail.cal];

    self.nutritionTwo.textColor = [UIColor greenColor];
    self.nutritionThree.text =[NSString stringWithFormat:@"Protein: %@",self.detail.protain];
    

    self.nutritionThree.textColor = [UIColor greenColor];
    self.scoreLabel.text =[NSString stringWithFormat:@"Score: %g",self.detail.score];

    self.scoreSlider.value = self.detail.score/100;
    [self.scoreSlider setMinimumTrackTintColor:[UIColor greenColor]];
    self.scoreSlider.enabled = NO;
    //NSString *path = [[NSBundle mainBundle] pathForResource:
                      //@"MyArray" ofType:@"plist"];
    //NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    //UIImage *picS = [array2 objectAtIndex:1];
    //AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //NSString *foodNameS = [NSString stringWithString:del.tempFoodName];
    //UIImage *img = [del.tempPic copy];
    //self.foodPic.image = img;
    //self.foodName.text = foodNameS;
    self.foodPic.image = self.passedPic;
    self.foodName.text = self.passedName;
    self.likeButton.layer.cornerRadius = 15;
    self.likeButton.layer.borderWidth = 1;
    self.likeButton.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.likeButton.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)likeButtonPress:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Like Button Pressed"
                          message:[NSString stringWithFormat:@"You liked %@",self.foodName]
                          delegate:self
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
