//
//  DashboardUtils.m
//  Task
//
//  Created by Nagarajan on 12/20/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "DashboardUtils.h"

@implementation DashboardUtils


+(void) addEntries:(NSMutableArray*)array
{
    if(nil != array && [array count] > 0)
    {
        NSString *path = [self getDbPath];
        [array writeToFile:path atomically:YES];
    }
}

+(NSString*) getDbPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *path = [documentsPath stringByAppendingPathComponent:@"Task.sqlite"];
    return path;
}

+(int) getEntryCountFromPlist
{
    NSString *path = [self getDbPath];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    return [array count];
}

+(NSArray*) getEntriesFromPlist
{
    NSString *path = [self getDbPath];
    NSArray *dBArray = [NSArray arrayWithContentsOfFile:path];
    return dBArray;
}

+(void) removeEntries
{
   NSString *plistPath = [self getDbPath];
   NSArray *plistArray = [NSArray arrayWithContentsOfFile:plistPath];
    
}

@end
