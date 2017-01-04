//
//  Recipe.h
//  SnapPeas
//
//  Created by Ren Zhou on 15/7/24.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject
@property(nonatomic,copy) NSString * recipe_id;
@property(nonatomic,copy) NSString * recipe_image;
@property(nonatomic,copy) NSString * recipe_name;
@property(nonatomic,copy) NSString * recipe_url;

+ (Recipe *) getRecipeByDic:(NSDictionary *) dic;


@end
