//
//  YDTasksViewController.h
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDViewController.h"


typedef enum{
    
    byDistance,
    byPrice,
    onMap
    
}DataRepresentingType;

@interface YDTasksViewController : YDViewController <UITableViewDataSource, UITableViewDelegate>

@end
