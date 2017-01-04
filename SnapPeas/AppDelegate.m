//
//  AppDelegate.m
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScreen.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonHMAC.h>
#import "FMDBManager.h"
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tempPic;
@synthesize tempFoodName;

-(AFHTTPRequestOperationManager *)manager{
    
    if (_manager==nil) {
        _manager=[AFHTTPRequestOperationManager manager];
    }
    return _manager;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //增加数据库
    [self setUpDatabase];
    
    // Override point for customization after application launch.
    if ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != ReachableViaWiFi) {
        UIAlertView * alert=[[UIAlertView alloc] initWithTitle:nil message:@"You do not have access to wireless. The application will not work correctly without access to the internet. Please connect and retry opening the application" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else
    {
        self.uid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSString * sql=@"select  * from Users where deviceUUID = %@";
        sql=[NSString stringWithFormat:sql,self.uid ];
        NSArray * array=[FMDBManager queryDataWithSql:sql];
        if([array count] == 0)
        {
            sql = [NSString stringWithFormat:@"insert into Users values (%@,'%@',%@,'%@','%@')",self.uid,self.uid,@"21",@"",@""];
            [FMDBManager queryDataWithSql:sql];
        }
        
        MainScreen *thirdVC = [[MainScreen alloc] initWithNibName:@"MainScreen" bundle:nil];
        self.navigationController = [[UINavigationController alloc]initWithRootViewController:thirdVC];
        self.window.rootViewController = self.navigationController;
    }
    MainScreen *thirdVC = [[MainScreen alloc] initWithNibName:@"MainScreen" bundle:nil];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:thirdVC];
    self.window.rootViewController = self.navigationController;
    return YES;
}


- (void)setUpDatabase{
    
    
    NSString * path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString * fullPath=[path stringByAppendingPathComponent:@"foods.sqlite"];
    
    NSLog(@"%@",fullPath);
    
    
    [FMDBManager openDatabaseWithPath:fullPath];
    
    
    NSString * userSql=@"create table if not exists Users (UserID integer primary key autoincrement,deviceUUID varchar,age integer, allergy text,goals1 text)";
    [FMDBManager executeUpdateWithSql:userSql andTips:@"Create Users table"];
    

    NSString * foodSql=@"create table if not exists Food (FoodID integer primary key autoincrement,name varchar,desc text, allergy text,picURL varchar)";
    [FMDBManager executeUpdateWithSql:foodSql andTips:@"Create Food table"];
    
    
    
    NSString * recipesSql=@"create table if not exists Recipes (RecipeID integer primary key autoincrement,name varchar,steps varchar, ingredient text,picURL varchar)";
    [FMDBManager executeUpdateWithSql:recipesSql andTips:@"Create Recipes table"];
    
    
    
    NSString * purchasesSql=@"create table if not exists Purchases (UserID integer  ,FoodID integer,date varchar)";
    [FMDBManager executeUpdateWithSql:purchasesSql andTips:@"Create Purchases table"];
    
    
    
    NSString * foodLikesSql=@"create table if not exists FoodLikes (UserID integer  ,FoodID integer,date varchar)";
    [FMDBManager executeUpdateWithSql:foodLikesSql andTips:@"Create FoodLikes table"];
    
    NSString * recipeLikesSql=@"create table if not exists RecipeLikes (UserID integer  ,FoodID integer,date varchar)";
    [FMDBManager executeUpdateWithSql:recipeLikesSql andTips:@"Create recipeLikesSql table"];
    
    
    NSString * str=@"select * from Users ";
    NSArray * array=[FMDBManager queryDataWithSql:str];
 
    //如果数据库数据为空则重新添加一个
    if (array.count==0) {
        NSString * sql=@"insert into Users (age,allergy,goals1) values(25,'egg#meat','23#42')";
        [FMDBManager executeUpdateWithSql:sql andTips:@""];
    }
    
    
}


-(void)dealloc{
//    [FMDBManager closeDatabase];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
