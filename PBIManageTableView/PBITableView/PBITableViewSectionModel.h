//
//  PBITableViewSectionModel.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PBITableViewCellModel.h"


typedef UIView * (^PBISectionViewRenderBlock)(NSInteger section, UITableView *tableView);

@interface PBITableViewSectionModel : NSObject 

@property (nonatomic, strong) NSMutableArray<PBITableViewCellModel *> *cellModelArray;

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;

@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, copy) PBISectionViewRenderBlock headerViewRenderBlock;
@property (nonatomic, copy) PBISectionViewRenderBlock footerViewRenderBlock;



@end
