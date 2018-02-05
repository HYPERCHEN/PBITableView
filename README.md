![Artboard.png](http://upload-images.jianshu.io/upload_images/1079898-aad8b4e240d26518.png)

[![language](https://img.shields.io/badge/Language-Objective--C-7D6FFF.svg)](https://developer.apple.com/documentation/objectivec)&nbsp;
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)&nbsp;
[![Build Status](https://api.travis-ci.org/Lision/LSAnimator.svg?branch=master)](https://travis-ci.org/Lision/LSAnimator)&nbsp;
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/Lision/LSAnimator/master/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%209%2B%20-orange.svg?style=flat)](https://www.apple.com/nl/ios/)

PBITableView is a kind of delightful tableview using MVVM.Compare the old ways, it provides a simply function to create the every single section, which makes creating complex tableview likes building blocks.What's more, it is convenient to provides some cell styles for static view.Hope it could help the iOS developers.

## Common View we need build

![WechatIMG2.jpeg](http://upload-images.jianshu.io/upload_images/1079898-4f71b5954638fa33.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

This type of tableview has several feature:

* regular cell style but includes different user interaction component like `switch` , `textfield` ,`label` and so on.
* there are many similar views in different apps.
* writing code for this view in a waste of time and energy.

Therefor we need to improve it.

## The old ways to create

```objective-c
self.tableview.delegate   = self;
self.tableview.datasource = self;
//Delagte and DataSource func
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cell;
}
```
Obviously, in this way, we need realize so many these functions and it is annoying especially we just want to realize some simple tableviews.

## The new ways to create 

PBITableView uses this simple functions to create:

```objective-c

-(void)init{
    [self initTableView];
    [self addBaseSection];
}
-(void)addBaseSection{
    [self.tableView headerView:^(PBITableViewSectionModel *sectionModel){
        //Set HeaderView
    } withCells:^(NSMutableArray *cellArray) {
        //Return specific cell
        UITableViewCell *cell = [UITableViewCell new];
        [cellArray addObject:cell]
        return cell;
    };
        [cellArray addObject:base1];
    } footerView:^(PBITableViewSectionModel *sectionModel){
        //Set footerView
    }];
}
```
Above all, it is the code about how to create a tableview with a section.All u need is realize the implementation of your cells and add the `cellArray`.U can set the appearance of section headerView and footerView By setting `sectionModel` properties.

I have written a demo in project.U can look up in detail.

## The way to use manage style cells

`PBIManageCell` provides 5 styles cell.Each cells have their own styles too.Pick the `style` when init the cell.
For example, I would use the `PBIMangeSwitchCell` to express it.

```objective-c
    
    //Init Func pick style through PBIMangeSwitchCellStyle
    +(PBIMangeSwitchCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView style:(PBIMangeSwitchCellStyle)style;
    
    //Cell Instance Implementation 
    PBIMangeSwitchCell *cell = [PBIMangeSwitchCell cellWithIdentifier:@"123" tableView:tableView style:PBIMangeSwitchCellStyleWithLeftIcon];
            cell.titleLabel.text = @"Switch Change Cell Background";
            cell.leftIcon.image = [UIImage imageNamed:@"warning"];
            __weak __typeof__(PBIMangeSwitchCell *) weak_cell = cell;
            cell.switchBlock = ^(BOOL switchValue) {
                if (switchValue == YES) {
                    weak_cell.backgroundColor = [UIColor greenColor];
                }else{
                    weak_cell.backgroundColor = [UIColor yellowColor];
                }
            };
```
According to the different cells, it provides aimed properties and blocks to edit.  

## Warning Retain cycle

Because of the block usage, please notice the retain cycle problem.
u can use this `__weak __typeof__(object) weak_object = object` and `__strong __typeof__(object) strong_object = object ` to avoid this problem

## Code Structure

There are two main parts : `PBIManageCell` and `PBITableView`

`PBIManageCell` contains:
* `PBIManageCellConst.h` 
* `UIView+PBIManageLayout`
* `PBIManageBaseCell.h`
* `PBIMangeSwitchCell.h`
* `PBIManageCustomCell.h`
* `PBIManageLabelCell.h`
* `PBIManageTextFieldCell.h`

`PBITableView` contains:
* `PBITableView.h` 
* `PBITableViewModel.h`
* `PBITableViewSectionModel.h`
* `PBITableViewCellModel.h`

## Installation

    #import PBIManageCell.h
    #import PBITableView.h
    //Then use the function in "The new ways to create" :）

## License
PBITableView is released under the MIT license. See LICENSE for details.


