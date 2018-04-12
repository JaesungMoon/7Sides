//
//  ViewController.m
//  ObjCGettingStarted
//
//  Created by JaesungMoon on 2018/04/13.
//  Copyright © 2018年 jaesung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSString *cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;

    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    cell.textLabel.text = @"Course Name";
    return cell;
}

@end
