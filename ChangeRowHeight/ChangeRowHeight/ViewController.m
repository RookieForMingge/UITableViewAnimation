//
//  ViewController.m
//  ChangeRowHeight
//
//  Created by 李阳 on 16/1/2016.
//  Copyright © 2016 LiChunYang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "ConfigurationCell.h"
#import "NSIndexPath+AddProperty.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSIndexPath * oldIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUserInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)buildUserInterface {
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [tableView registerClass:[ConfigurationCell class] forCellReuseIdentifier:@"cellID"];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ConfigurationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"第%ld区", (long)section);
    if (section == 0) {
        return 5;
    }
    else if (section == 1) {
        return 2;
    }
    else {
        return 5;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"indexPath: %@: %ld: %ld",indexPath, indexPath.section, indexPath.row);
    NSLog(@"old index: %@: %ld: %ld",self.oldIndexPath, (long)self.oldIndexPath.section, self.oldIndexPath.row);
    
    static int i = 0;
    
    if ([indexPath hash] == [self.oldIndexPath hash]) {
        if (i == 0) {
            [tableView.indexPathsForVisibleRows enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSIndexPath * index = obj;
                index.isOpen = NO;
            }];
            [tableView beginUpdates];
            [tableView endUpdates];
            i = 1;
        }
        else {
            indexPath.isOpen = YES;
            [tableView beginUpdates];
            [tableView endUpdates];
            i = 0;
        }
    }
    else {
        [tableView.indexPathsForVisibleRows enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSIndexPath * index = obj;
            index.isOpen = NO;
        }];
        i = 0;
        indexPath.isOpen = ! indexPath.isOpen;
        [tableView beginUpdates];
        [tableView endUpdates];
        indexPath.isOpen = NO;
    }
    self.oldIndexPath = indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld %ld", (long)indexPath.section, (long)indexPath.row);
    if (indexPath.isOpen == YES) {
        return 100;
    }
    else {
        return 50;
    }
}

@end
