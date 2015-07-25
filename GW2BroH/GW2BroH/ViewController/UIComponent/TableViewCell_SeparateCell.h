//
//  TableViewCell_SeparateCell.h
//  GW2BroH
//
//  Created by Coody on 2015/7/21.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

#define D_CellHight_Normal 112
#define D_CellHight_Selected 260


/**  */
typedef enum : NSInteger{
    EnumSeparatorTableViewCell_None = 0,
    EnumSeparatorTableViewCell_WorldBoss
}EnumSeparatorTableViewCell;

/**
 *
 */
@interface TableViewCell_SeparateCell : UITableViewCell

// basic property
@property (nonatomic , readonly) EnumSeparatorTableViewCell cellType;

// for public UI component
@property (nonatomic , strong) UIImageView *imageView_First;
@property (nonatomic , strong) UILabel *textLabel_First;
@property (nonatomic , strong) UILabel *textLabel_Second;
@property (nonatomic , strong) UILabel *textLabel_Third;

/***/
-(void)setupCell:(id)tempModel withType:(EnumSeparatorTableViewCell)tempEnumSeparatorTableViewCell;

/** 清除所有 Cell 內的元件設定 */
-(void)clear;

-(void)isFirstCell;

@end
