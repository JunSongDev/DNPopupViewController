//
//  ViewController.m
//  DNPopupViewController
//
//  Created by zjs on 2018/9/29.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "ViewController.h"
#import "DNPresentationController/DNPresentationManager.h"
#import "TestViewController.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
- (IBAction)modalButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)modalButton:(id)sender {
    
    TestViewController * viewControl = [[TestViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewControl];
    
    DNPresentationConfig * config = [[DNPresentationConfig alloc] initWithModalSize:CGSizeMake(SCREEN_W*0.75, SCREEN_W) position:DNPresentationControllerPositionCenter];
    [[DNPresentationManager defaultManager] dn_popModalControllerWithConfig:config superVC:self subVC:nav];
}
@end
