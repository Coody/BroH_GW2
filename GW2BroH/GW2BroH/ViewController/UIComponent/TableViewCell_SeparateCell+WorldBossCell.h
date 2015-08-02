//
//  TableViewCell_SeparateCell+WorldBossCell.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/7/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell.h"

@class WorldBossModel;

@interface TableViewCell_SeparateCell (WorldBossCell)

-(void)setupCellWithWorldBossModel:(WorldBossModel *)tempWorldBossModel;

-(void)selectedWorldBossCell:(BOOL)isSelected;

-(void)isFirstWorldBossCell;

@end
