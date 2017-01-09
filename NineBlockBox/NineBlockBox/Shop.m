//
//  Shop.m
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _name = dict[@"name"];
        _icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

@end
