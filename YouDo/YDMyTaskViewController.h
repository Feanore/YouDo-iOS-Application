//
//  YDMyTaskViewController.h
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDViewController.h"
typedef enum{
    
    MyTasks,
    ExecutingTasks
    
}DataRepresentingType;

@interface YDMyTaskViewController : YDViewController <UITableViewDelegate, UITableViewDataSource>

@end
