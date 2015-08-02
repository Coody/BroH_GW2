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
    
    [self createBackgroundViewWithType:tempCoinsAndGemsCellType];
    
    [self createTextFieldWithType:tempCoinsAndGemsCellType];
    
    [self createLabel];
}

-(void) createBackgroundViewWithType:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType{
    if ( self.imageView_First == nil ) {
        self.imageView_First = [[UIImageView alloc] init];
    }
    self.imageView_First.frame = CGRectMake(0, 0, self.frame.size.width, 110);
    switch (tempCoinsAndGemsCellType) {
        case EnumSeparatorTableViewCell_Coins:
            [self.imageView_First setImage:[GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"goldCell"]];
            break;
        case EnumSeparatorTableViewCell_Gems:
            [self.imageView_First setImage:[GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"gemCell"]];
            break;
        default:
            break;
    }
    [self addSubview:self.imageView_First];
    
}

-(void)createTextFieldWithType:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType{
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    if ( self.textField_First == nil ) {
        self.textField_First = [[UITextField alloc] init];
    }
    switch (tempCoinsAndGemsCellType) {
        case EnumSeparatorTableViewCell_Coins:
            self.textField_First.frame = CGRectMake(10, 48, 110, 54);
            [self.textField_First setTextColor:[UIColor yellowColor]];
            [self.textField_First setText:@"1"];
            break;
        case EnumSeparatorTableViewCell_Gems:
            self.textField_First.frame = CGRectMake(10, 48, 98, 54);
            [self.textField_First setTextColor:[UIColor colorWithRed:0.38f green:0.58f blue:0.82f alpha:1.0f]];
            [self.textField_First setText:@"10"];
            break;
        default:
            break;
    }
    
    [self.textField_First setBackgroundColor:[UIColor clearColor]];
    [self.textField_First setFont:[UIFont boldSystemFontOfSize:40.0f]];
    [self.textField_First setTextAlignment:(NSTextAlignmentRight)];
    [self.textField_First setKeyboardType:(UIKeyboardTypeNumberPad)];
    [self.textField_First setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:self.textField_First];
}

-(void)createLabel{
    
}

#pragma mark - Select Cell
-(void)selectedCoinsAndGemsCell:(BOOL)isSelected{
    
}

@end
