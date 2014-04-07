//
//  YDCategoriesViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDCategoriesViewController.h"

@interface YDCategoriesViewController ()

@end

@implementation YDCategoriesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(dissmissControllerView)];
    self.navigationItem.rightBarButtonItem = cancel;
    cancel.tintColor = MAJOR_COLOR;
    
    
}
- (void) dissmissControllerView{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
