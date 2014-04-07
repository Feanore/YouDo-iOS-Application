//
//  YDMainTabbarController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDMainTabbarController.h"

@interface YDMainTabbarController ()

@end

@implementation YDMainTabbarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.tabBar.translucent = NO;
    
    NSDictionary *paramsNormal = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    NSDictionary *paramsSelected = [[NSDictionary alloc] initWithObjectsAndKeys:MAJOR_COLOR, NSForegroundColorAttributeName, nil];
    
    
    UITabBarItem *tasks = [self.tabBar.items objectAtIndex:0];
    tasks.title = NSLocalizedString(@"Tasks", nil);
    [tasks setTitleTextAttributes:paramsNormal
                         forState:UIControlStateNormal];
    [tasks setTitleTextAttributes:paramsSelected
                         forState:UIControlStateSelected];
    
    
    UITabBarItem *newtasks = [self.tabBar.items objectAtIndex:1];
    newtasks.title = NSLocalizedString(@"My Task", nil);
    [newtasks setTitleTextAttributes:paramsNormal
                            forState:UIControlStateNormal];
    [newtasks setTitleTextAttributes:paramsSelected
                            forState:UIControlStateSelected];
    
    
    UITabBarItem *notification = [self.tabBar.items objectAtIndex:2];
    notification.title = NSLocalizedString(@"Notification", nil);
    [notification setTitleTextAttributes:paramsNormal
                                forState:UIControlStateNormal];
    [notification setTitleTextAttributes:paramsSelected
                                forState:UIControlStateSelected];
    
    
    UITabBarItem *profile = [self.tabBar.items objectAtIndex:3];
    profile.title = NSLocalizedString(@"Profile", nil);
    [profile setTitleTextAttributes:paramsNormal
                           forState:UIControlStateNormal];
    [profile setTitleTextAttributes:paramsSelected
                           forState:UIControlStateSelected];
    

    
    
}
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont boldSystemFontOfSize:18.0f];
        [titleView setTextColor:MAJOR_COLOR];
        self.navigationItem.titleView = titleView;
        
    }
    titleView.text = title;
    [titleView sizeToFit];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
