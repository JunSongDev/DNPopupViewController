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
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
- (IBAction)centerButton:(id)sender;
- (IBAction)buttomButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)centerButton:(id)sender {
    
    TestViewController * viewControl = [[TestViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewControl];
    
    DNPresentationConfig * config = [[DNPresentationConfig alloc] initWithModalSize:CGSizeMake(SCREEN_W*0.75, SCREEN_W) position:DNPresentationControllerPositionCenter];
    [[DNPresentationManager defaultManager] dn_popModalControllerWithConfig:config
                                                               presentingVC:self
                                                                presentedVC:nav];
}

- (IBAction)buttomButton:(id)sender {
    
    TestViewController * viewControl = [[TestViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewControl];
    
    DNPresentationConfig * config = [[DNPresentationConfig alloc] initWithModalSize:CGSizeMake(SCREEN_W, SCREEN_W) position:DNPresentationControllerPositionSheet];
    [[DNPresentationManager defaultManager] dn_popModalControllerWithConfig:config presentingVC:self presentedVC:nav];
}
- (IBAction)leadButton:(id)sender {
    
    TestViewController * viewControl = [[TestViewController alloc] init];
    
    DNPresentationConfig * config = [[DNPresentationConfig alloc] initWithModalSize:CGSizeMake(SCREEN_W*0.8, SCREEN_H) position:DNPresentationControllerPositionLeading];
    [[DNPresentationManager defaultManager] dn_popModalControllerWithConfig:config presentingVC:self presentedVC:viewControl];
}
- (IBAction)trailButton:(id)sender {
    
    TestViewController * viewControl = [[TestViewController alloc] init];
    
    DNPresentationConfig * config = [[DNPresentationConfig alloc] initWithModalSize:CGSizeMake(SCREEN_W*0.8, SCREEN_H) position:DNPresentationControllerPositionTrailing];
    [[DNPresentationManager defaultManager] dn_popModalControllerWithConfig:config presentingVC:self presentedVC:viewControl];
}

@end
