//
//  TempItem.h
//  SnapPeas
//
//  Created by Labuser on 7/15/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TempItem : NSObject
{
    NSString *name;
    NSString *url;
}
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *url;

-(id)newObject:(NSString *)n pic: (NSString *)u;
@end
