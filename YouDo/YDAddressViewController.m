//
//  YDAddressViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 21.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDAddressViewController.h"

@interface YDAddressViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation YDAddressViewController

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
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Ready", nil) style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(rightBarbuttonDidPress)];
    rightBarButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
- (void) rightBarbuttonDidPress{
    [self.navigationController popViewControllerAnimated:YES];
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
