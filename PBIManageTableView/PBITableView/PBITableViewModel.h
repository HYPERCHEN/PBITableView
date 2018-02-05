//
//  PBITableViewModel.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "PBITableViewSectionModel.h"
#import "PBITableViewCellModel.h"

typedef void (^PBILinkSectionBlock)(PBITableViewSectionModel *);

typedef void (^PBILinkCellsArrayBlock)(NSMutableArray *cellArray);

@interface PBITableViewModel : NSObject <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray<PBITableViewSectionModel *> *sectionModelArray;


@end
