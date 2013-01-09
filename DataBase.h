//
//  DataBase.h
//  Task
//
//  Created by Nagarajan on 1/7/13.
//  Copyright (c) 2013 Nagarajan. All rights reserved.
//
#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface DataBase : NSObject
{
    sqlite3 *database;
}


-(void) getValuesFromNewTask;
-(void) getValuesFromCompletedTask;
@end