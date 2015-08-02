//
//  TableViewCell_SeparateCell+CoinsAndGems.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/8/1.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell.h"

@interface TableViewCell_SeparateCell (CoinsAndGems)

-(void)setupCellWithConis;

-(void)setupCellWithGems;

-(void)selectedCoinsAndGemsCell:(BOOL)isSelected;

-(void)setCoinsAndGemsLabel:(NSInteger)tempGoldsOrGems;

@end
