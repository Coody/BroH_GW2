//
//  TableViewCell_SeparateCell+CoinsAndGems.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/8/1.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell.h"

// for Web Request
#import "GW2_Request_Coins.h"
#import "GW2_Request_Gems.h"

@interface TableViewCell_SeparateCell (CoinsAndGems) < GW2_Request_Coins_Protocol,
                                                       GW2_Request_Gems_Protocol >

-(void)setupCellWithConis;

-(void)setupCellWithGems;

-(void)selectedCoinsAndGemsCell:(BOOL)isSelected;

-(void)setCoinsAndGemsLabel:(NSInteger)tempGoldsOrGems;

@end
