//
//  PBITableViewCellModel.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef UITableViewCell * (^PBICellRenderBlock)(NSIndexPath *indexPath, UITableView *tableView);

typedef NSIndexPath * (^PBICellWillSelectBlock)(NSIndexPath *indexPath, UITableView *tableView);

typedef void (^PBICellSelectionBlock)(NSIndexPath *indexPath, UITableView *tableView);

typedef void (^PBICellWillDisplayBlock)(UITableViewCell *cell, NSIndexPath *indexPath, UITableView *tableView);

typedef void (^PBICellCommitEditionBlock)(NSIndexPath *indexPath, UITableView *tableView,
                                       UITableViewCellEditingStyle editingStyle);

@interface PBITableViewCellModel : NSObject

@property (nonatomic, copy) PBICellRenderBlock renderBlock; //Required

@property (nonatomic, copy) PBICellWillDisplayBlock willDisplayBlock;
@property (nonatomic, copy) PBICellWillSelectBlock willSelectBlock;
@property (nonatomic, copy) PBICellWillSelectBlock willDeselectBlock;
@property (nonatomic, copy) PBICellSelectionBlock selectionBlock;
@property (nonatomic, copy) PBICellSelectionBlock deSelectionBlock;
@property (nonatomic, copy) PBICellCommitEditionBlock commitEditBlock;

//U need add more blocks and properties according to delegate func u need to realize

@property (nonatomic, assign) CGFloat height; //Required

@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, assign) BOOL canMove;
@property (nonatomic, assign) UITableViewRowAnimation  animationStyle;
@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;

@property (nonatomic, copy) NSString *deleteConfirmationButtonTitle;


@end
