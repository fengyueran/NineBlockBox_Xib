//
//  Shop.h
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Shop : UIView
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopWithDict:(NSDictionary *)dict;
@end
