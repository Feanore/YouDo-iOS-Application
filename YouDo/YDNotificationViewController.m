//
//  YDNotificationViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDNotificationViewController.h"

@interface YDNotificationViewController ()

@property (weak, nonatomic) IBOutlet UITableView *notificationTableView;

@end

@implementation YDNotificationViewController

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
    
    self.notificationTableView.delegate   = self;
    self.notificationTableView.dataSource = self;
    
    [self setTitle:NSLocalizedString(@"Notifications", nil)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    

    cell.textLabel.text = @"Notifications";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
