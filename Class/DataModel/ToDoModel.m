//
//  ToDoModel.m
//  Task
//
//  Created by Nagarajan on 1/2/13.
//  Copyright (c) 2013 Nagarajan. All rights reserved.
//

#import "ToDoModel.h"
#import "SharedObject.h"

@implementation ToDoModel
@synthesize taskName;
@synthesize date;
@synthesize comments;

-(id) init
{
    self = [super init];
    if(self)
    {
        taskName = [[NSString alloc] init];
        date = [[NSString alloc] init];
        comments = [[NSString alloc] init];
    }
    return self;
}

-(void) parseData:(NSMutableArray*) dataArray
{
    if(nil != dataArray && [dataArray count] >0)
    {
        NSMutableArray *array = [NSMutableArray array];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
       
        self.taskName = [dataArray objectAtIndex:0];
        self.date = [dataArray objectAtIndex:1];
        self.comments = [dataArray objectAtIndex:2];
        [dict setObject:self.taskName forKey:@"taskname"];
        [dict setObject:self.date forKey:@"date"];
        [dict setObject:self.comments forKey:@"comments"];
        
        [array addObject:dict];
        
        TodoModelEntity *modelEntity = [SharedObject sharedInstance].todoModelEntity;
        [modelEntity.modelArray addObject:array];
    }
}
@end


@implementation CompletedModel
@synthesize taskName;
@synthesize date;
@synthesize comments;

-(id) init
{
    self = [super init];
    if(self)
    {
        taskName = [[NSString alloc] init];
        date = [[NSString alloc] init];
        comments = [[NSString alloc] init];
    }
    return self;
}
-(void) parseCompletedData:(NSMutableArray*) completedArray
{
    if(nil != completedArray && [completedArray count] >0)
    {
        NSMutableArray *array = [NSMutableArray array];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        self.taskName = [completedArray objectAtIndex:0];
        self.date = [completedArray objectAtIndex:1];
        self.comments = [completedArray objectAtIndex:2];
        [dict setObject:self.taskName forKey:@"taskname"];
        [dict setObject:self.date forKey:@"date"];
        [dict setObject:self.comments forKey:@"comments"];
        
        [array addObject:dict];
        
        CompletedModelEntity *temp = [SharedObject sharedInstance].completedModelEntity;
        [temp.completedModelArray addObject:array];
    }
}



@end

///
//ToDoModel Entity class
//

@implementation TodoModelEntity
@synthesize modelArray;

-(id) init
{
    self = [super init];
    if(self)
    {
        modelArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end

///
//CompletedmodelEntity Class
///
@implementation CompletedModelEntity
@synthesize completedModelArray;

-(id) init
{
    self = [super init];
    if(self)
    {
        completedModelArray = [[NSMutableArray alloc] init];
    }
    return self;
}


@end