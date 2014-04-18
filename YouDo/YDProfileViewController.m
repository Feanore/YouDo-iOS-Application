//
//  YDProfileViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDProfileViewController.h"

@interface YDProfileViewController ()

@end

@implementation YDProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTranslucent:NO];
    [self setTitle:NSLocalizedString(@"My Profile", nil)];
    
    UIImage *settingsIcon = [[UIImage imageNamed:@"settings.png"] scaledToSize:CGSizeMake(25, 25)];
    UIBarButtonItem *settings = [[UIBarButtonItem alloc] initWithImage:settingsIcon
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(presentSettingsView)];
    settings.tintColor = MAJOR_COLOR;
    self.navigationItem.rightBarButtonItem = settings;
    
}
- (void) presentSettingsView{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YDViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"settingsController"];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
