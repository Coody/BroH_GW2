//
//  TableViewCell_SeparateCell+CoinsAndGems.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/8/1.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell+CoinsAndGems.h"

// for Tools
#import "GW2BroH_Tools.h"

@implementation TableViewCell_SeparateCell (CoinsAndGems)

-(void)setupCellWithConis{
    [self setupCellWithConisAndGemsModel:EnumSeparatorTableViewCell_Coins];
}

-(void)setupCellWithGems{
    [self setupCellWithConisAndGemsModel:EnumSeparatorTableViewCell_Gems];
}

-(void)setupCellWithConisAndGemsModel:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType{
    
    [self createBackgroundViewWithType:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType];
    
    [self createTextField];
    
    [self createLabel];
}

-(void) createBackgroundViewWithType:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType{
    if ( self.imageView_First == nil ) {
        self.imageView_First = [[UIImageView alloc] init];
    }
    switch (tempCoinsAndGemsCellType) {
        case EnumSeparatorTableViewCell_Coins:
            [self.imageView_First setImage:[GW2BroH_Tools getImageWithClass:self withImageName:@"goldCell"]];
            break;
        case EnumSeparatorTableViewCell_Gems:
            [self.imageView_First setImage:[GW2BroH_Tools getImageWithClass:self withImageName:@"gemCell"]];
            break;
        default:
            break;
    }
    [self addSubview:self.imageView_First];
    
}

-(void)createTextField{
    
}

-(void)createLabel{
    
}

#pragma mark - Select Cell
-(void)selectedCoinsAndGemsCell:(BOOL)isSelected{
    
}

@end
