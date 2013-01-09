//
//  DataBase.m
//  Task
//
//  Created by Nagarajan on 1/7/13.
//  Copyright (c) 2013 Nagarajan. All rights reserved.
//

#import "DataBase.h"
#import "TodoModel.h"
#import "SharedObject.h"
@implementation DataBase



-(void) getValuesFromNewTask
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    ToDoModel *model = [[ToDoModel alloc] init];
    TodoModelEntity *modelEntity = [SharedObject sharedInstance].todoModelEntity;
    [modelEntity.modelArray removeAllObjects];
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        
        const char *sql = "SELECT * FROM NewTask";
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSMutableArray *array = [NSMutableArray array];
                NSString *taskName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSString *date = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *comments = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                [array addObject:taskName];
                [array addObject:date];
                [array addObject:comments];
                
                [model parseData:array];
                
            }
        }
    }
    
}
-(void) getValuesFromCompletedTask
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    CompletedModel *model = [[CompletedModel alloc] init];
    CompletedModelEntity *modelEntity = [SharedObject sharedInstance].completedModelEntity;
    [modelEntity.completedModelArray removeAllObjects];
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        
        const char *sql = "SELECT * FROM CompletedTask";
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSMutableArray *array = [NSMutableArray array];
                NSString *taskName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSString *date = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *comments = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                [array addObject:taskName];
                [array addObject:date];
                [array addObject:comments];
                
                [model parseCompletedData:array];
                
            }
        }
    }
    
}

@end
