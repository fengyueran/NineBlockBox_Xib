//
//  ViewController.m
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"
#import "ShopView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *HUDLabel;
- (IBAction)add:(UIButton *)sender;
- (IBAction)remove:(UIButton *)sender;
@property (nonatomic, strong) NSArray *shops;

@end

@implementation ViewController

- (NSArray *)shops {
    if (!_shops) {
        NSString *file = [[NSBundle mainBundle]pathForResource:@"shops" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:file];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Shop *shop = [Shop shopWithDict:dict];
            [mutableArr addObject:shop];
        }
        _shops = mutableArr;
    }
    return _shops;
}

//view创建完毕，载入内存，还未渲染出画面时调用。
- (void)viewDidLoad {
    [super viewDidLoad];
    self.removeButton.enabled = NO;
    self.HUDLabel.hidden = YES;
}

- (IBAction)add:(UIButton *)sender {
    CGFloat shopViewWidth = 100;
    CGFloat shopViewHeight = 138;
    NSInteger numberOfItem = 3;
    //商品的索引
    NSUInteger index = self.shopsView.subviews.count;
    
    //商品的x值
    NSUInteger colum = index % numberOfItem;
    CGFloat colMagin = (self.shopsView.frame.size.width - numberOfItem * shopViewWidth) / (numberOfItem - 1);
    CGFloat shopX = colum * (shopViewWidth + colMagin);
    
    //商品的y值
    NSUInteger row = index / numberOfItem;
    CGFloat rowMagin = 10;
    CGFloat shopY = row * (shopViewHeight +rowMagin);
    
    //添加商品view
    ShopView *shopView = [ShopView shopView];
    
    shopView.frame = CGRectMake(shopX, shopY, shopViewWidth, shopViewHeight);
    
    
    Shop *shop = self.shops[index];
//    shopView.iconImgView.image = [UIImage imageNamed:shop.icon];
//shopView.nameLabel.text = shop.name;
    
    shopView.shop = shop;
    [self.shopsView addSubview:shopView];

    //控制按钮的可用性
    [self checkState];
}


- (IBAction)remove:(UIButton *)sender {
    [self.shopsView.subviews.lastObject removeFromSuperview];
    [self checkState];
}

- (void)checkState {
    self.addButton.enabled = self.shopsView.subviews.count < self.shops.count;
    self.removeButton.enabled = self.shopsView.subviews.count != 0;
    if (!self.addButton.enabled) {
        self.HUDLabel.hidden = NO;
        self.HUDLabel.text = @"已经添加满了";
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.0];
    }
    if (!self.removeButton.enabled) {
        self.HUDLabel.hidden = NO;
        self.HUDLabel.text = @"已经删除完了";
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.0];
    }
}

- (void)hideHUD {
    self.HUDLabel.hidden = YES;
}

@end
