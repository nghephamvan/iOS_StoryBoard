//
//  EditTaskController.h
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/20/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Task;

@interface EditTaskController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UISwitch *switchDone;
@property (strong, nonatomic) Task *task;

- (IBAction)taskDataChanged:(id)sender;

@end
