//
//  TempItem.m
//  SnapPeas
//
//  Created by Labuser on 7/15/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import "TempItem.h"

@implementation TempItem
@synthesize name;
@synthesize url;

+(id)newObject:(NSString *) n pic: (NSString *) u
{
    [self name] = n;
    [self url] = u;
    return self;
}

@end
