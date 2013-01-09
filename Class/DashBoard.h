//
//  DashBoard.h
//  Task
//
//  Created by Nagarajan on 12/24/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DashBoard : NSObject
+(void) addEntries:(NSMutableArray*)array;
+(NSString*) getPlistPath;
+(int) getEntryCountFromPlist;
+(NSArray*) getEntriesFromPlist;
-(void)removeEntries;


@end
