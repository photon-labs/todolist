//
//  DashBoard.m
//  Task
//
//  Created by Nagarajan on 12/24/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "DashBoard.h"

@implementation DashBoard
+(void) addEntries:(NSMutableArray*)array
{
    if(nil != array && [array count] > 0)
    {
        NSString *plistPath = [self getPlistPath];
        [array writeToFile:plistPath atomically:YES];
    }
}

+(NSString*) getPlistPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"CompletedTask.plist"];
    return plistPath;
}

+(int) getEntryCountFromPlist
{
    NSString *plistPath = [self getPlistPath];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    return [array count];
}

+(NSArray*) getEntriesFromPlist
{
    NSString *plistPath = [self getPlistPath];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:plistPath];
    return plistArray;
}


@end
