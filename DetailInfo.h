//
//  DetailInfo.h
//  SnapPeas
//
//  Created by Ren Zhou on 15/7/22.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailInfo : NSObject


@property(nonatomic,strong) NSString * serving;
@property(nonatomic,strong) NSString * cal;
@property(nonatomic,strong) NSString * protain;

@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * url;
@property(nonatomic,assign) CGFloat score;

+ (DetailInfo *) getDetailWith:(NSString *) cal andServing:(NSString * ) serving andProtain:(NSString *) protain andScore:(CGFloat) score;


@end
