//
//  Recipe.m
//  SnapPeas
//
//  Created by Ren Zhou on 15/7/24.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

+ (Recipe *) getRecipeByDic:(NSDictionary *) dic{


    Recipe * recip=[[Recipe alloc] init];
    
     recip.recipe_id=dic[@"recipe_id"];
     recip.recipe_image=dic[@"recipe_image"];
     recip.recipe_name=dic[@"recipe_name"];
     recip.recipe_url=dic[@"recipe_url"];
    
    return recip;
    
    
}


@end
