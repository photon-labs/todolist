//
//  ToDoModel.h
//  Task
//
//  Created by Nagarajan on 1/2/13.
//  Copyright (c) 2013 Nagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoModel : NSObject
{
    NSString *taskName;
    NSString *date;
    NSString *comments;
}
@property (nonatomic, strong) NSString *taskName;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *comments;

-(void) parseData:(NSMutableArray*) dataArray;

@end

@interface CompletedModel : NSObject
{
    NSString *taskName;
    NSString *date;
    NSString *comments;
}
@property (nonatomic, strong) NSString *taskName;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *comments;

-(void) parseCompletedData:(NSMutableArray*) completedArray;

@end



@interface TodoModelEntity : NSObject
{
    NSMutableArray *modelArray;
}

@property (nonatomic, strong) NSMutableArray *modelArray;
@end

@interface CompletedModelEntity : NSObject
{
    NSMutableArray *completedModelArray;
}

@property (nonatomic, strong) NSMutableArray *completedModelArray;
@end