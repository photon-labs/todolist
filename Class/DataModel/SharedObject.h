//
//  SharedObject.h
//  Task
//
//  Created by Nagarajan on 1/2/13.
//  Copyright (c) 2013 Nagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoModel.h"

@interface SharedObject : NSObject
{
    TodoModelEntity *todoModelEntity;
    CompletedModelEntity *completedModelEntity;
}

@property (nonatomic, strong) TodoModelEntity *todoModelEntity;
@property (nonatomic,strong) CompletedModelEntity *completedModelEntity;

+(SharedObject*) sharedInstance;

@end
