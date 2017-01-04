//
//  Food.h
//  SnapPeas
//
//  Created by Ren Zhou on 15/7/25.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property(nonatomic,copy) NSString * food_name;
@property(nonatomic,assign) NSInteger  food_id;
@property(nonatomic,copy) NSString * ingredient_description;
@property(nonatomic,copy) NSString * ingredient_url;

@end
