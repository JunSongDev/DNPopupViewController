//
//  TestViewController.m
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@end

@implementation TestViewController

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
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.title = @"测试的模态弹窗";
    
    [self addSubviewsForSuper];
    
    [self setLeftBarButtonItem];
    
    // Do any additional setup after loading the view.
}

#pragma mark ----- DidReceiveMemoryWarning -----

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----- addSubviewsForSuper -----

- (void)addSubviewsForSuper {
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.tableFooterView = UIView.new;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
//    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
//    NSLayoutConstraint * top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
//    NSLayoutConstraint * left = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
//    NSLayoutConstraint * bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
//    NSLayoutConstraint * right = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
//
//    [self.view addConstraints:@[top,left,bottom,right]];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.frame;
}

#pragma mark ----- addConstraintsForSuper -----

- (void)addConstraintsForSuper {
    
}

#pragma mark ----- PrivateMethods -----

- (void)setLeftBarButtonItem {
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithTitle:@"❌" style:UIBarButtonItemStylePlain target:self action:@selector(dismidssClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)dismidssClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ----- PublicMethods -----

#pragma mark ----- NetWork request -----

#pragma mark ----- UITableViewDelegate -----
 
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
     
     UIViewController *vc = [[UIViewController alloc] init];
     vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                               green:arc4random_uniform(255)/255.0
                                                blue:arc4random_uniform(255)/255.0
                                               alpha:1.0];
     [self.navigationController pushViewController:vc animated:YES];
 }
 

#pragma mark ----- UITableViewDataSource -----

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = [NSString stringWithFormat:@"%ld",indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = identifier;
    return cell;
}

#pragma mark ----- OtherDelegate -----

#pragma mark ----- OtherDataSource -----

#pragma mark ----- Getter -----

#pragma mark ----- Setter -----

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
