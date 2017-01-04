//
//  RecipeDetailView.m
//  SnapPeas
//
//  Created by Labuser on 7/20/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "RecipeDetailView.h"
#import "RecipeIngredientsTable.h"
#import "RecipeDirectionsTable.h"
#import "DetailInfo.h"
#import "AFNetworking.h"
#import "OAuthCore.h"
#import "OAuth+Additions.h"
#import "NSData+Base64.h"
#import <CommonCrypto/CommonHMAC.h>
#import "FMDBManager.h"
#import "OAuthCore.h"
#import "UIImageView+WebCache.h"
#import "Direction.h"
#import "Food.h"

#define FAT_SECRET_API_ENDPOINT @"http://platform.fatsecret.com/rest/server.api"

@interface RecipeDetailView ()
@property(nonatomic,strong) DetailInfo * detail;

/**请求管理*/
@property(nonatomic,strong) AFHTTPRequestOperationManager * manager;

/**directions*/
@property(nonatomic,strong) NSMutableArray * directionArray;

/**foods*/
@property(nonatomic,strong) NSMutableArray * foodArray;


@end

@implementation RecipeDetailView


-(NSMutableArray *)directionArray{
    if (_directionArray==nil) {
        _directionArray=[NSMutableArray array];
    }
    return _directionArray;
    
}

-(NSMutableArray *)foodArray{
    if (_foodArray==nil) {
        _foodArray=[NSMutableArray array];
    }
    return _foodArray;
    
}

-(AFHTTPRequestOperationManager *)manager{
    
    if (_manager==nil) {
        _manager=[AFHTTPRequestOperationManager manager];
    }
    return _manager;
}
- (id)initWithData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)myData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSURL *url = [NSURL URLWithString:[myData objectAtIndex:1]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.passedName = [myData objectAtIndex:0];
    self.passedPic = [[UIImage alloc] initWithData:data];
     self.detail=myData[2];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nutritionOne.text = @"Servings: 1";
    self.nutritionOne.textColor = [UIColor greenColor];
    self.nutritionTwo.text = @"Calories: 100";
    self.nutritionTwo.textColor = [UIColor greenColor];
    self.nutritionThree.text = @"Protein: 2g";
    self.nutritionThree.textColor = [UIColor greenColor];
    self.recipeName.text = self.passedName;
    [self.recipePic setImageWithURL:[NSURL URLWithString:self.recipe.recipe_image] placeholderImage:nil];
    self.directionsButton.layer.cornerRadius = 15;
    self.directionsButton.layer.borderWidth = 1;
    self.directionsButton.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.directionsButton.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.ingredientsButton.layer.cornerRadius = 15;
    self.ingredientsButton.layer.borderWidth = 1;
    self.ingredientsButton.layer.borderColor = [UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    self.ingredientsButton.layer.backgroundColor =[UIColor colorWithRed:0 green:0.498 blue:0 alpha:1].CGColor;
    
    NSDictionary *params = @{@"recipe_id" : self.recipe.recipe_id};
    [self makeRequestWithMethod:@"recipe.get" parameters:params completion:^(NSDictionary *data) {
        
    }];
}




- (IBAction)pushIngredientsButton:(id)sender {
    RecipeIngredientsTable *recipeIng = [[RecipeIngredientsTable alloc]initWithNibName:@"RecipeIngredientsTable" bundle:nil];
    
    recipeIng.foodArray=self.foodArray;
    [self.navigationController pushViewController:recipeIng animated:YES];
}
- (IBAction)pushDirectionsButton:(id)sender {
    RecipeDirectionsTable *recipeDir = [[RecipeDirectionsTable alloc]initWithNibName:@"RecipeDirectionsTable" bundle:nil];
    recipeDir.array=self.directionArray;
    [self.navigationController pushViewController:recipeDir animated:YES];
}




- (void) makeRequestWithMethod:(NSString *)method
                    parameters:(NSDictionary *)params
                    completion:(void (^)(NSDictionary *data))completionBlock {
    
    
    NSMutableDictionary *parameters = [params mutableCopy];
    [parameters addEntriesFromDictionary:[self defaultParameters]];
    [parameters addEntriesFromDictionary:@{ @"method" : method }];
    
    NSString *queryString = [self queryStringFromDictionary:parameters];
    NSData *data          = [NSData dataWithBytes:[queryString UTF8String] length:queryString.length];
    NSString *authHeader  = OAuthorizationHeader([NSURL URLWithString:FAT_SECRET_API_ENDPOINT],
                                                 @"GET",
                                                 data,
                                                 @"9921d3f511a542a8b32b8841bb1d62ed",
                                                 @"f8fa1d96494046c69159099ab153ea1e",
                                                 nil,
                                                 @"");
    
    
    [self.manager GET:[FAT_SECRET_API_ENDPOINT stringByAppendingFormat:@"?%@", authHeader] parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
        
        NSLog(@"%@",responseObject);

        NSDictionary * dic=responseObject[@"recipe"];
        dic=dic[@"serving_sizes"][@"serving"];
        
        self.nutritionOne.text = [NSString stringWithFormat:@"Servings: %@",dic[@"serving_size"]];
        self.nutritionOne.textColor = [UIColor greenColor];
        self.nutritionTwo.text =  [NSString stringWithFormat:@"Calories: %@",dic[@"calories"]];
        
        self.nutritionTwo.textColor = [UIColor greenColor];
        self.nutritionThree.text =[NSString stringWithFormat:@"Protein: %@",dic[@"protein"]];
        
        //解析direction
        NSArray * tempDirection=responseObject[@"recipe"][@"directions"][@"direction"];

        for (NSDictionary * dic in tempDirection) {
            Direction  * di=[[Direction alloc] init];
            di.direction_description=dic[@"direction_description"];
            di.direction_number=[dic[@"direction_number"] integerValue];
            [self.directionArray addObject:di];
        }
        
        //解析food
        NSArray * tempFood=responseObject[@"recipe"][@"ingredients"][@"ingredient"];
        for (NSDictionary * dic in tempFood) {
            Food  * food=[[Food alloc] init];
            food.food_id=[dic[@"food_id"] integerValue];
            food.food_name=dic[@"food_name"];
            food.ingredient_description=dic[@"ingredient_description"];
            food.ingredient_url=dic[@"ingredient_url"];
         
            [self.foodArray addObject:food];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

- (NSDictionary *) defaultParameters {
    return @{ @"format": @"json" };
}

- (NSString *) queryStringFromDictionary:(NSDictionary *)dict {
    NSMutableArray *entries = [@[] mutableCopy];
    
    for (NSString *key in dict) {
        NSString *value = [dict objectForKey:key];
        [entries addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    return [entries componentsJoinedByString:@"&"];
}


#pragma mark - 跳转
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    

}


@end
