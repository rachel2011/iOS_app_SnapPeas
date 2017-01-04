//
//  FoodDetailView.h
//  SnapPeas
//
//  Created by Labuser on 7/15/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailInfo.h"
#import "Food.h"

@interface FoodDetailView : UIViewController
@property (nonatomic, retain) NSString *passedName;
@property (nonatomic, retain) UIImage *passedPic;
@property(nonatomic) BOOL *isSomethingEnabled;
@property (weak, nonatomic) IBOutlet UIImageView *foodPic;

@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UIImageView *suggestionOne;
@property (weak, nonatomic) IBOutlet UILabel *suggestionNameOne;
@property (weak, nonatomic) IBOutlet UIImageView *suggestionTwo;
@property (weak, nonatomic) IBOutlet UILabel *suggestionNameTwo;
@property (weak, nonatomic) IBOutlet UIImageView *suggestionThree;
@property (weak, nonatomic) IBOutlet UILabel *suggestionNameThree;
@property (weak, nonatomic) IBOutlet UISlider *scoreSlider;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *nutritionOne;
@property (weak, nonatomic) IBOutlet UILabel *nutritionTwo;
@property (weak, nonatomic) IBOutlet UILabel *nutritionThree;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property(nonatomic,strong) Food * food;
@property(nonatomic,strong) NSArray * foodArray;


@property(nonatomic,strong) DetailInfo * detail;



- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData;
@end
