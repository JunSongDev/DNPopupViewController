//
//  DNPopupController.m
//  DNPopupViewController
//
//  Created by zjs on 2018/10/8.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPopupController.h"

@interface DNPopupController ()

@end

@implementation DNPopupController

#pragma mark ----- LifeCycle -----

/**
 
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 
 -(void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self subViewsConfig];
    // Do any additional setup after loading the view.
}

#pragma mark ----- DidReceiveMemoryWarning -----

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----- addSubviewsForSuper -----

- (void)addSubviewsForSuper {
    
}

- (void)subViewsConfig {
    
}

#pragma mark ----- addConstraintsForSuper -----

- (void)addConstraintsForSuper {
    
}

#pragma mark ----- PrivateMethods -----

#pragma mark ----- PublicMethods -----

#pragma mark ----- NetWork request -----

#pragma mark ----- UITableViewDelegate -----
/**
 
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
 }
 */

#pragma mark ----- UITableViewDataSource -----

/**
 
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 return <#expression#>;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 return expression;
 }
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 return <#expression#>;
 }
 */

#pragma mark ----- OtherDelegate -----

#pragma mark ----- OtherDataSource -----

#pragma mark ----- Getter -----

#pragma mark ----- Setter -----

@end
