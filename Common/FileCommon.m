//
//  FileCommon.m
//  Common
//
//  Created by 程嘉雯 on 15/10/22.
//  Copyright © 2015年 com.epoluodi.Common. All rights reserved.
//

#import "FileCommon.h"

@implementation FileCommon



#pragma 目录

+(NSString *)getHomeDirectory
{
    return NSHomeDirectory();
}

+(NSString *)getDocumentsDirectory
{
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [docPath objectAtIndex:0];
    NSLog(@"Documents目录：%@",documentsPath);
    return documentsPath;
}


+(NSString *)getCacheDirectory
{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    NSLog(@"Cache目录：%@",cachePath);
    return cachePath;
}

+(NSString *)getTempDirectory
{
    return NSTemporaryDirectory();
}
#pragma -


@end
