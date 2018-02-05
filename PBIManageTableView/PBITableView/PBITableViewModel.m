//
//  PBITableViewModel.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBITableViewModel.h"

@implementation PBITableViewModel

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.cellModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    UITableViewCell *cell = nil;
    PBICellRenderBlock renderBlock = cellModel.renderBlock;
    if (renderBlock) {
        cell = renderBlock(indexPath, tableView);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    PBICellWillDisplayBlock willDisplayBlock = cellModel.willDisplayBlock;
    if (willDisplayBlock) {
        willDisplayBlock(cell, indexPath, tableView);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.footerTitle;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.canEdit;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    PBICellCommitEditionBlock commitEditBlock = cellModel.commitEditBlock;
    if (commitEditBlock) {
        commitEditBlock(indexPath, tableView, editingStyle);
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.footerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    PBISectionViewRenderBlock headerViewRenderBlock = sectionModel.headerViewRenderBlock;
    if (headerViewRenderBlock) {
        return headerViewRenderBlock(section, tableView);
    } else {
        return sectionModel.headerView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    PBISectionViewRenderBlock footerViewRenderBlock = sectionModel.footerViewRenderBlock;
    if (footerViewRenderBlock) {
        return footerViewRenderBlock(section, tableView);
    } else {
        return sectionModel.footerView;
    }
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView
           willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    PBICellWillSelectBlock willSelectBlock = cellModel.willSelectBlock;
    ;
    if (willSelectBlock) {
        return willSelectBlock(indexPath, tableView);
    }
    return indexPath;
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView
         willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    PBICellWillSelectBlock willDeselectBlock = cellModel.willDeselectBlock;
    ;
    if (willDeselectBlock) {
        return willDeselectBlock(indexPath, tableView);
    }
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    PBICellSelectionBlock selectionBlock = cellModel.selectionBlock;
    if (selectionBlock) {
        selectionBlock(indexPath, tableView);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    PBICellSelectionBlock deSelectionBlock = cellModel.deSelectionBlock;
    if (deSelectionBlock) {
        deSelectionBlock(indexPath, tableView);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.deleteConfirmationButtonTitle;
}

#pragma mark - Private Function

- (PBITableViewSectionModel*)sectionModelAtSection:(NSInteger)section {
    PBITableViewSectionModel *sectionModel = self.sectionModelArray[section];
    return sectionModel;
}

- (PBITableViewCellModel*)cellModelAtIndexPath:(NSIndexPath *)indexPath {
    PBITableViewSectionModel *sectionModel = self.sectionModelArray[indexPath.section];
    PBITableViewCellModel *cellModel = sectionModel.cellModelArray[indexPath.row];
    return cellModel;
}

#pragma mark - Lazy Init

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sectionModelArray = [NSMutableArray array];
    }
    return self;
}


@end
