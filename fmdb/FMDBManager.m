//
//  FMDBManager.m
//  ch08FMDB
//
//  Created by jredu on 15/5/19.
//  Copyright (c) 2015年 jredu. All rights reserved.
//

#import "FMDBManager.h"

static FMDatabase * db;

@implementation FMDBManager


/**
 *  创建数据库实例，并且打开
 *
 *  @return <#return value description#>
 */

+ (void) openDatabaseWithPath:(NSString *) path{
    if (db==nil) {
        //初始化数据库对象
        db=[[FMDatabase alloc] initWithPath:path];
        
        //打开数据库
        BOOL flag=[db open];
        if (flag) {
            NSLog(@"数据库打开成功");
        }else{
            NSLog(@"数据库打开失败");
        }
    }

}

//执行更新操作1
+ (BOOL)executeUpdateWithSql:(NSString * ) sql andTips:(NSString *) tips{
    
    //判断数据库是否打开
    if (db==nil) {
        NSLog(@"数据库没有打开");
        return NO ;
    }
    
    BOOL flag=[db executeUpdate:sql];
    
    //如果你传入的提示不为空则打印操作提示
    if (tips) {
        NSString * str=[tips stringByAppendingString:flag?@"成功":@"失败"];
        NSLog(@"%@",str);
    }
    
    return flag;
}

//执行更新操作2
+ (BOOL)executeUpdateWithSql:(NSString *) sql andArgumentsInArray:(NSArray *) array andTips:(NSString *) tips{
    
    
    //判断数据库是否打开
    if (db==nil) {
        NSLog(@"数据库没有打开");
        return NO ;
    }
    
    //如果打开了继续进行操作
     BOOL flag=[db executeUpdate:sql withArgumentsInArray:array];
    
    //如果你传入的提示不为空则打印操作提示
    if (tips) {
        NSString * str=[tips stringByAppendingString:flag?@"成功":@"失败"];
        NSLog(@"%@",str);
    }
    
    return flag;


}


/**
 *  封装查询方法
 *
 *  @param sql <#sql description#>
 *
 *  @return <#return value description#>
 */
+ (NSMutableArray *) queryDataWithSql:(NSString * ) sql{
    
    
    //判断数据库是否打开
    if (db==nil) {
        NSLog(@"数据库没有打开");
        return  nil;
    }
    
    //如果打开了继续进行操作
    NSMutableArray * array=[NSMutableArray array];
    FMResultSet * resultSet=[db executeQuery:sql];
    
    
    //返当前结果集的列数
    NSInteger count= resultSet.columnCount;
    
    while (resultSet.next) {
        NSMutableDictionary * dic=[NSMutableDictionary dictionary];
        for (int i=0; i<count; i++) {
            
            //获取当前的列名
            NSString * colum=[resultSet columnNameForIndex:i];
            //获取当前列对应的值（全部包装成对象类型）
            id temValue=[resultSet objectForColumnIndex:i];
            //将包装好的键值对放入字典
            [dic setObject:temValue forKey:colum];
           
        }

        //将字典加入数组
        [array addObject:dic];
    }
    
    
    return array;
    
}




/**
 *  关闭数据库
 */

+ (void)closeDatabase{
    [db close];
    db=nil;
}

@end
