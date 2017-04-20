//
//  EditTaskController.h
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/20/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTaskController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UISwitch *switchDone;

@end
