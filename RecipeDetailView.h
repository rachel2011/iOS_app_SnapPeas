//
//  RecipeDetailView.h
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface RecipeDetailView : UIViewController
@property(nonatomic,strong)Recipe * recipe;

@property (nonatomic, retain) NSString *passedName;
@property (nonatomic, retain) UIImage *passedPic;
@property (strong, nonatomic) IBOutlet UILabel *nutritionOne;
@property (strong, nonatomic) IBOutlet UILabel *nutritionTwo;
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
@property (strong, nonatomic) IBOutlet UIImageView *recipePic;
@property (strong, nonatomic) IBOutlet UIButton *directionsButton;

@property (strong, nonatomic) IBOutlet UIButton *ingredientsButton;
@property (strong, nonatomic) IBOutlet UILabel *nutritionThree;
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData;
@end
