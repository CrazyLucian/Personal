//
//  QXHYaoQingImageCell.m
//  quxianghui
//
//  Created by 余潇逸 on 2019/6/28.
//  Copyright © 2019 xiaoyaogu. All rights reserved.
//

#import "QXHYaoQingImageCell.h"
#import "quxianghui-Swift.h"
#import "FSPagerViewObjcCompat.h"

@interface QXHYaoQingImageCell()<FSPagerViewDataSource,FSPagerViewDelegate>
@property (strong, nonatomic) NSArray<NSString *> *imageNames;
@property (strong, nonatomic) NSArray<NSString *> *transformerNames;
@property (strong  , nonatomic) FSPagerView *pagerView;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLable;

//滚动图片数量
@property (nonatomic ) NSInteger imageNumber;
//图片数组
@property (nonatomic ) NSMutableArray *imageArray;



@end

@implementation QXHYaoQingImageCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imageNumber = 0;
        self.imageArray = [[NSMutableArray alloc]init];
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)createUI{
    [self.pagerView registerClass:[FSPagerViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.pagerView.isInfinite = YES;
    
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(34);
        make.top.equalTo(self.pagerView.mas_bottom).offset(15);
        make.width.equalTo(4);
        make.height.equalTo(15);
    }];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lineView.mas_centerY);
        make.left.equalTo(self.lineView.mas_right).offset(15);
    }];
    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_left);
        make.right.equalTo(-34);
        make.top.equalTo(self.lineView.mas_bottom).offset(19);
    }];
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBCOLOR(89, 175, 141);
        [self addSubview:_lineView];
    }
    return _lineView;
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = @"分享奖励规则";
        _titleLable.font = [UIFont systemFontOfSize:16];
        _titleLable.textColor = RGBCOLOR(51, 51, 51);
        [self addSubview:_titleLable];
    }
    return _titleLable;
}
-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc]init];
        _contentLable.text = @" 1、点击下面去分享按钮\n 2、选择发生方式\n 3、发送邀请二维码给好友\n 4、好友通过扫描w二维码下载注册app即可;\n";
        _contentLable.font = [UIFont systemFontOfSize:12];
        _contentLable.numberOfLines = 0;
        _contentLable.textColor = RGBCOLOR(136, 136, 136);
        [self addSubview:_contentLable];
    }
    return _contentLable;
}
-(FSPagerView *)pagerView{
    if (!_pagerView) {
        _pagerView = [[FSPagerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 500)];
        _pagerView.delegate = self;
        _pagerView.dataSource = self;
        _pagerView.transformer = [[FSPagerViewTransformer alloc] initWithType:FSPagerViewTransformerTypeLinear];
        CGAffineTransform transform = CGAffineTransformMakeScale(0.7, 1);
        _pagerView.itemSize = CGSizeApplyAffineTransform(self.pagerView.frame.size, transform);
        _pagerView.decelerationDistance = FSPagerViewAutomaticDistance;
        [_pagerView registerClass:[FSPagerViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self addSubview:_pagerView];
    }
    return _pagerView;
}
- (NSInteger)numberOfItemsInPagerView:(FSPagerView *)pagerView{
        return self.imageArray.count;
}

- (FSPagerViewCell *)pagerView:(FSPagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    FSPagerViewCell * cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cell" atIndex:index];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[index]]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imageView.clipsToBounds = YES;
    return cell;
}
- (void)configUIWithModel:(NSMutableArray *)model{
        self.imageArray  = model;
        [self.pagerView reloadData];
}
@end
