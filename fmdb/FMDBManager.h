//
//  FMDBManager.h
//  ch08FMDB
//
//  Created by jredu on 15/5/19.
//  Copyright (c) 2015年 jredu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface FMDBManager : NSObject
/**
 *  初始化数据库连接
 *
 *  @param path 传入的沙盒路径
 */
+ (void) openDatabaseWithPath:(NSString *) path;


/**
 *  执行语句
 *
 *  @param sql  要执行的sql
 *  @param tips 提示
 *
 *  @return 返回是否成功
 */
+ (BOOL)executeUpdateWithSql:(NSString * ) sql andTips:(NSString *) tips;




/**
 *  执行语句
 *
 *  @param sql  要执行的sql
 *  @param array 参数数组
 *
 *  @return 返回是否成功
 */
+ (BOOL)executeUpdateWithSql:(NSString *) sql andArgumentsInArray:(NSArray *) array andTips:(NSString *) tips;


/**
 *  封装查询方法
 *
 *  @param sql 查询语句
 *
 *  @return 返回结果集数组
 */
+ (NSMutableArray *) queryDataWithSql:(NSString * ) sql;

/**
 *  关闭数据库
 */
+ (void)closeDatabase;
@end
