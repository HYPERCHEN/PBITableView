//
//  PBITableViewCellModel.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBITableViewCellModel.h"

@implementation PBITableViewCellModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.height = UITableViewAutomaticDimension;
    }
    return self;
}

@end
