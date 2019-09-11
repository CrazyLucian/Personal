//
//  QXHAboutUsTableViewCell.m
//  quxianghui
//
//  Created by 苏晓凯 on 2019/6/11.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHAboutUsTableViewCell.h"
#import "QXHmyCollectionViewController.h"
#import "QXHAboutUsViewController.h"
#import "QXHActivityPageViewController.h"
#import "QXHKuaiBaoViewController.h"
@implementation QXHAboutUsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.cornerRadius = 5;
    self.backView.clipsToBounds = YES;
    [self.contentView addSubview:self.backView];
    self.backView.frame = CGRectMake(12, 0, SCREEN_WIDTH - 24, 200);
    //    [self.backView makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(UIEdgeInsetsMake(0, 12, 0, 12));
    //    }];
    
    
    
    
    self.labelNames = @[@"官方公告",@"我的收藏",@"关于我们",@"商务合作"];
    [self.backView addSubview:self.tableView];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]
                      initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 24, 200)
                      style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];

        
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
        return 50.f;
   
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
        NSArray *imageArr = @[@"公告",@"collect_personal",@"关于我们(1)",@"合作"];
        cell.textLabel.text = self.labelNames[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.row]];
        return cell;
    }
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        QXHKuaiBaoViewController *vc = [QXHKuaiBaoViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        QXHmyCollectionViewController *vc = [QXHmyCollectionViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        QXHAboutUsViewController *vc = [QXHAboutUsViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        //暂且 调整 活动页面  
        QXHActivityPageViewController *vc = [[QXHActivityPageViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
  

}
- (UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }return nil;
    
}
@end
