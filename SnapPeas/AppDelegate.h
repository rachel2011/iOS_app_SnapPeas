//
//  AppDelegate.h
//  SnapPeas
//
//  Created by Labuser on 7/14/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import <CommonCrypto/CommonHMAC.h>
#import "FMDBManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, retain) UINavigationController *navigationController;
@property (strong, retain) NSString *tempFoodName;
@property (strong, retain) UIImage *tempPic;
@property (strong, retain) NSString *uid;
@property (nonatomic,strong) FMDatabase * fmdb;
@property(nonatomic,strong) AFHTTPRequestOperationManager * manager;
@end

