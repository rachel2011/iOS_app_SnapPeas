//
//  MainScreen.m
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "MainScreen.h"
#import "HCell.h"
#import "ConstantVars.h"
#import "UserDetailView.h"
#import "FMDBManager.h"
#import "OAuthCore.h"
#import "AFNetworking.h"
#import "DetailInfo.h"
#import "Recipe.h"
#define FAT_SECRET_API_ENDPOINT @"http://platform.fatsecret.com/rest/server.api"
@interface MainScreen ()

@property(nonatomic,strong) NSMutableArray * purchaseArray;

@property(nonatomic,strong) NSMutableArray * recommendArray;

@property(nonatomic,strong) NSMutableArray * recipeArray;
@property(nonatomic,strong) NSMutableArray * foodArray;
@property(nonatomic,assign) NSInteger count;
/**请求管理*/
@property(nonatomic,strong) AFHTTPRequestOperationManager * manager;
@end

@implementation MainScreen

-(NSMutableArray *)foodArray{
    
    if (_foodArray ==nil) {
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
-(NSMutableArray *)purchaseArray{

    if (_purchaseArray ==nil) {
        _purchaseArray=[NSMutableArray array];
    }
    return _purchaseArray;

}
-(NSMutableArray *)recommendArray{
    
    if (_recommendArray ==nil) {
        _recommendArray=[NSMutableArray array];
    }
    return _recommendArray;
    
}
-(NSMutableArray *)recipeArray{
    
    if (_recipeArray ==nil) {
        _recipeArray=[NSMutableArray array];
    }
    return _recipeArray;
    
}





@synthesize itemDict;
- (void)rightBarButtonPushed{
    UserDetailView *userV = [[UserDetailView alloc]initWithData:@"UserDetailView" bundle:nil data:nil];
    [self.navigationController pushViewController:userV animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    
    UIBarButtonItem	*rightButton = [[UIBarButtonItem alloc]
                                    initWithTitle: @"Account"
                                    style: UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(rightBarButtonPushed)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    self.itemDict = @{
                      @"Past Purchases" : [NSArray arrayWithObjects:
                                           [NSArray arrayWithObjects:@"Colby Cheese",@"http://images.fatsecret.com/food/65317626-e907-419a-b913-681cd7c65fdc.jpg", nil,nil],
                                           [NSArray arrayWithObjects:@"Feta Cheese",@"http://images.fatsecret.com/food/34ce00d2-0c23-4cbc-9664-f38879d856b8.jpg", nil, nil],
                                           [NSArray arrayWithObjects:@"Egg Omelet",@"http://images.fatsecret.com/food/15fe4a7a-0e19-4545-b367-56599481831d.jpg", nil, nil],
                                           [NSArray arrayWithObjects:@"strawberry",@"https://upload.wikimedia.org/wikipedia/commons/2/29/PerfectStrawberry.jpg", nil, nil],
                                           [NSArray arrayWithObjects:@"Edam Cheese",@"http://images.fatsecret.com/food/98dd3f9b-aa26-4dbf-acaa-7e1681a44ac0.jpg", nil, nil],
                                           [NSArray arrayWithObjects:@"Cottage Cheese",@"http://images.fatsecret.com/food/14ea4ecd-8f69-47da-96ad-ca3cecd667bd.jpg", nil, nil],nil],
                      @"Recommended Foods" :
                           [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"Fruit Yogurt",@"http://images.fatsecret.com/food/4f3d9fe9-5887-4f5d-8d0f-52c1927ea7f9.jpg",nil, nil],
                           [NSArray arrayWithObjects:@"Egg (Whole)",@"http://images.fatsecret.com/food/36aa840e-ed53-4321-ac6d-ef66887e0efa.jpg",nil, nil],
                           [NSArray arrayWithObjects:@"Egg White",@"http://images.fatsecret.com/food/9992c1c8-f2c1-4b92-9066-1ec745441dd7.jpg",nil, nil],
                           [NSArray arrayWithObjects:@"Egg Yolk",@"http://images.fatsecret.com/food/13086a08-1754-4096-aa93-636e663b0f90.jpg",nil, nil],
                           [NSArray arrayWithObjects:@"Scrambled",@"http://images.fatsecret.com/food/d0b3ec03-3c8c-429b-b889-086c0a0bbe1c.jpg",nil, nil],
                           [NSArray arrayWithObjects:@"Cottage Cheese",@"http://images.fatsecret.com/food/14ea4ecd-8f69-47da-96ad-ca3cecd667bd.jpg",nil, nil],nil],
                      @"Recommended Recipes" : [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"Chicken Bites",@"http://www.fatsecret.com/static/recipe/e74b0d9e-0203-4321-a4f4-835330e68837.jpg", nil],[NSArray arrayWithObjects:@"alapeno Poppers",@"http://www.fatsecret.com/static/recipe/95cf6eac-51d0-499d-ad2c-bc621e97aa13.jpg",nil],[NSArray arrayWithObjects:@"Hummus with Spinach",@"http://www.fatsecret.com/static/recipe/276f0068-5678-48a7-9fb2-e55b9a6a11ab.jpg",nil],[NSArray arrayWithObjects:@"Chicken Strips",@"http://www.fatsecret.com/static/recipe/1c51e5db-e615-4fd8-9611-5746825722d3.jpg",nil],[NSArray arrayWithObjects:@"Guacamole",@"http://www.fatsecret.com/static/recipe/a3f376ec-1d7c-4d70-9f22-3279730d860c.jpg", nil],[NSArray arrayWithObjects:@"Marinated",@"http://www.fatsecret.com/static/recipe/45f81445-ab14-4edc-a271-ea36c5b19491.jpg", nil],nil],
                      //
                      @"Try Something New" : [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"apple4",@"http://images.wisegeek.com/gala-apple.jpg", nil],[NSArray arrayWithObjects:@"banana4",@"https://www.organicfacts.net/wp-content/uploads/2013/05/Banana3.jpg", nil],[NSArray arrayWithObjects:@"mango4",@"http://mangomaniafl.net/wp-content/uploads/2014/06/iStock_000012591574Medium.jpg", nil],[NSArray arrayWithObjects:@"strawberry4",@"https://upload.wikimedia.org/wikipedia/commons/2/29/PerfectStrawberry.jpg", nil],[NSArray arrayWithObjects:@"watermellon4",@"http://dingo.care2.com/pictures/greenliving/uploads/2012/08/Watermellon.jpg", nil],[NSArray arrayWithObjects:@"carrot4",@"hhttp://pngimg.com/upload/carrot_PNG4985.png", nil],nil]};
    [self.tableView setBackgroundColor:kVerticalTableBackgroundColor];
    self.tableView.rowHeight = kCellHeight + (kRowVerticalPadding * 0.5) + ((kRowVerticalPadding * 0.5) * 0.5);
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *temp = [itemDict.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return [temp objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"HCell";
    
    HCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[HCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
   
    
    if(indexPath.section == 2){
        cell.rowType = @"recipe";
        cell.recipeArray=self.recipeArray;
       

    }else{
        cell.rowType = @"food";
        cell.purchaseArray=self.foodArray;
        
        if (self.foodArray.count>0) {
            if(indexPath.section==0){
                cell.purchaseArray=@[self.foodArray[0],self.foodArray[1],self.foodArray[2],self.foodArray[3],self.foodArray[4]];
                
            }else if(indexPath.section==1){
                
                 cell.purchaseArray=@[self.foodArray[5],self.foodArray[6],self.foodArray[7],self.foodArray[8],self.foodArray[9]];
            }else{
                cell.purchaseArray=@[self.foodArray[3],self.foodArray[4],self.foodArray[5],self.foodArray[6],self.foodArray[7]];
                
            }
        }
      

    }
    
     [cell reloadData];
       return cell;
}



#pragma mark - 加载数据
- (void) loadData{

 
    //解析食谱数据
    NSDictionary *params1 = @{@"food_id" : @"33691"};
    
    [self makeRequestWithMethodFood:@"food.get" parameters:params1 array:nil url:@"http://images.fatsecret.com/food/65317626-e907-419a-b913-681cd7c65fdc.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params2 = @{@"food_id" : @"33692"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params2 array:nil url:@"http://images.fatsecret.com/food/ef8dc3c2-d4c6-48e5-953c-511413b8e85a.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params3 = @{@"food_id" : @"33693"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params3 array:nil url:@"http://images.fatsecret.com/food/61596e5c-f7b0-4ef7-9c97-981e4e4d37a3_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params4 = @{@"food_id" : @"33694"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params4 array:nil url:@"http://images.fatsecret.com/food/940cc012-df74-4dd0-b0a1-fff9509e337e_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params5 = @{@"food_id" : @"33695"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params5 array:nil url:@"http://images.fatsecret.com/food/6c59af84-d9df-4701-be70-18830c07335c_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params6 = @{@"food_id" : @"33696"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params6 array:nil url:@"http://images.fatsecret.com/food/14ea4ecd-8f69-47da-96ad-ca3cecd667bd_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params7 = @{@"food_id" : @"33698"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params7 array:nil url:@"http://images.fatsecret.com/food/98dd3f9b-aa26-4dbf-acaa-7e1681a44ac0_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params8 = @{@"food_id" : @"33699"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params8 array:nil url:@"http://images.fatsecret.com/food/5c223047-f3c7-4449-b46f-a24ca344c486_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params9 = @{@"food_id" : @"33689"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params9 array:nil url:@"http://images.fatsecret.com/food/ce461fb8-57cb-49eb-acd7-1d2941b5fdca_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    NSDictionary *params10 = @{@"food_id" : @"33690"};
    [self makeRequestWithMethodFood:@"food.get" parameters:params10 array:nil url:@"http://images.fatsecret.com/food/61596e5c-f7b0-4ef7-9c97-981e4e4d37a3_sq.jpg" completion:^(NSDictionary *data) {
        
    }];
    
    
    
    
   
    
    
    //解析食谱数据
    NSDictionary *params = @{@"recipe_type" : @"Appetizer"};
    
    [self makeRequestWithMethodRecipe:@"recipes.search" parameters:params array:self.purchaseArray completion:^(NSDictionary *data) {
        
    }];
    
}


- (void) makeRequestWithMethodFood:(NSString *)method
                        parameters:(NSDictionary *)params array:(NSMutableArray * ) array url:(NSString *) url
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
    
    NSString * path=[FAT_SECRET_API_ENDPOINT stringByAppendingFormat:@"?%@", authHeader];
    NSURL * urls=[NSURL URLWithString:path];
    
    NSURLRequest * request=[NSURLRequest requestWithURL:urls];
   NSData * datas= [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary * responseObject=[NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:nil];
    
    DetailInfo * detail=[[DetailInfo alloc] init];
    NSDictionary * dic=responseObject[@"food"];
    NSString * foodName=dic[@"food_name"];
    detail.name=foodName;
    detail.url=url;
    
    NSDictionary * sub=[dic[@"servings"][@"serving"] firstObject];
    detail.cal=sub[@"calories"];
    detail.score=10*arc4random_uniform(4)+50;
    detail.protain=sub[@"protein"];
    detail.serving=@"1";
          [self.foodArray addObject:detail];
    
    self.count++;
    if (self.count>=10) {
        NSLog(@"=========");
        [self.tableView reloadData];
    }
    

    
//    [self.manager GET:[FAT_SECRET_API_ENDPOINT stringByAppendingFormat:@"?%@", authHeader] parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
//        
//        DetailInfo * detail=[[DetailInfo alloc] init];
//        NSDictionary * dic=responseObject[@"food"];
//        NSString * foodName=dic[@"food_name"];
//        detail.name=foodName;
//        detail.url=url;
//        
//        NSDictionary * sub=[dic[@"servings"][@"serving"] firstObject];
//        detail.cal=sub[@"calories"];
//        detail.score=10*arc4random_uniform(4)+50;
//        detail.protain=sub[@"protein"];
//        detail.serving=@"1";
////      [self.foodArray addObject:detail];
//        
//        self.count++;
//        if (self.count>=10) {
//            NSLog(@"=========");
//            [self.tableView reloadData];
//        }
//        
//        
//        
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    
    
}

- (void) makeRequestWithMethodRecipe:(NSString *)method
                    parameters:(NSDictionary *)params array:(NSMutableArray * ) array
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
        
        NSDictionary * dic=responseObject[@"recipes"];
        NSArray * tempArray=dic[@"recipe"];
        
        for (int i=0;i<tempArray.count;i++) {
            Recipe * recip=[Recipe getRecipeByDic:tempArray[i]];
            [self.recipeArray addObject:recip];
            
            //获取前六条
            if (i==5) {
                break;
            }
            
        }
        
        [self.tableView reloadData];

        
        
        
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


@end
