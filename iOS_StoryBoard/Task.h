//
//  NSObject+Task.h
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/18/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task: NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL done;
-(id) initWithName: (NSString *)name done: (BOOL) done;
@end
