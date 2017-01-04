//
//  DetailInfo.m
//  SnapPeas
//
//  Created by Ren Zhou on 15/7/22.
//  Copyright (c) 2015年 wustl. All rights reserved.
//

#import "DetailInfo.h"

@implementation DetailInfo


+ (DetailInfo *) getDetailWith:(NSString *) cal andServing:(NSString * ) serving andProtain:(NSString *) protain andScore:(CGFloat) score{
    
    DetailInfo * de=[[DetailInfo alloc] init];
    
    de.cal=cal;
    de.serving=serving;
    de.protain=protain;
    de.score=score;
    
    return de;
}
@end
