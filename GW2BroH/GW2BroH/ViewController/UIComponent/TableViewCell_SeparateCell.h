//
//  TableViewCell_SeparateCell.h
//  GW2BroH
//
//  Created by Coody on 2015/7/21.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WorldBossModel;

typedef enum : NSInteger{
    EnumSeparatorTableViewCell_None = 0,
    EnumSeparatorTableViewCell_WorldBoss
}EnumSeparatorTableViewCell;

@interface TableViewCell_SeparateCell : UITableViewCell

@property (nonatomic , strong) UIImageView *imageView_First;
@property (nonatomic , strong) UILabel *textLabel_First;
@property (nonatomic , strong) UILabel *textLabel_Second;
@property (nonatomic , strong) UILabel *textLabel_Third;

-(void)setupCell:(WorldBossModel *)tempModel withType:(EnumSeparatorTableViewCell)tempEnumSeparatorTableViewCell;

-(void)clear;

@end
