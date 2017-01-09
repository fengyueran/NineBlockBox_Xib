//
//  XHView.m
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import "ShopView.h"

@interface ShopView ()


@end

@implementation ShopView

+ (instancetype)shopView {
    return [[[NSBundle mainBundle]loadNibNamed:@"shop" owner:nil options:nil] firstObject];
}
- (void)setShop:(Shop *)shop {
    _shop = shop;
    self.nameLabel.text = shop.name;
    self.iconImgView.image = [UIImage imageNamed:shop.icon];
}
@end
