//
//  User.h
//  fatsecret
//
//  Created by Ren Zhou on 15/7/20.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property(nonatomic,assign)NSInteger userId;
@property(nonatomic,copy)NSString * deviceUUID;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,copy)NSString * allergy;
@property(nonatomic,copy)NSString * goals;
@property(nonatomic,copy)NSString * displayName;



+ (User *) getUserByDic:(NSDictionary * )dic;

@end
