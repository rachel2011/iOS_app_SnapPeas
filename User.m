//
//  User.m
//  fatsecret
//
//  Created by Ren Zhou on 15/7/20.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import "User.h"

@implementation User


+ (User *) getUserByDic:(NSDictionary * )dic{
    
//UserID integer primary key autoincrement,deviceUUID varchar,age integer, allergy text,goals1 text
    User * user=[[User alloc] init];
    user.userId=[dic[@"UserID"] integerValue];
    user.deviceUUID=dic[@"deviceUUID"];
    user.age=[dic[@"age"] integerValue];
    user.allergy=dic[@"allergy"];
    user.goals=dic[@"goals1"];
    user.displayName=dic[@"displayName"];
    
    
    return user;
    
    
    
}
@end
