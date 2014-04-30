//
//  YDAdditionalConViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 21.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDAdditionalConViewController.h"



@interface YDAdditionalConViewController ()

@property (nonatomic) UISwitch *messageSwitch;
@property (nonatomic) UISwitch *privacySwitch;

@end

@implementation YDAdditionalConViewController

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
    [self setWhiteBackButtonItem];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat offset = 20;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, offset, 300, 60)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 240, 60)];
    label.numberOfLines = 3;
    label.textColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"Get a SMS", nil);
    [view addSubview:label];
    
    self.messageSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(240, 15, 60, 40)];
    
    [view addSubview:self.messageSwitch];
    
    offset += view.frame.size.height + 10;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, offset, 300, 60)];
    label.numberOfLines = 5;
    label.textColor = [UIColor darkGrayColor];
    label.text = NSLocalizedString(@"You will receive notifications about new proposals to the task", nil);
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    offset += label.frame.size.height + 10;
    
    view = [[UIView alloc] initWithFrame:CGRectMake(10, offset, 300, 60)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    self.privacySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(240, 15, 60, 40)];
    
    [view addSubview:self.privacySwitch];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 240, 60)];
    label.numberOfLines = 3;
    label.textColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"Make private", nil);
    [view addSubview:label];

    offset += view.frame.size.height + 10;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, offset, 300, 60)];
    label.numberOfLines = 5;
    label.textColor = [UIColor darkGrayColor];
    label.text = NSLocalizedString(@"Assignments can only be seen by performers and will be hidden after", nil);
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
