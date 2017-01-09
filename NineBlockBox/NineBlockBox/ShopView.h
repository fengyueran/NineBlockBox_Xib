//
//  XHView.h
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

@interface ShopView : UIView

+ (instancetype)shopView;
//商品属性
@property (nonatomic, strong) Shop *shop;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@end
