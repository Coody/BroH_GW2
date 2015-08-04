//
//  TableViewCell_SeparateCell+CoinsAndGems.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/8/1.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell+CoinsAndGems.h"

// for Tools
#import "Constants.h"
#import "GW2BroH_Tools.h"



@implementation TableViewCell_SeparateCell (CoinsAndGems)

//CATEGORY_PROPERTY_GET_SET(GW2_Request_Coins*,coinsRequest, setCoinsRequest:)

#pragma mark - 開放方法
-(void)setupCellWithConis{
    
    [self setupCellWithConisAndGemsModel:EnumSeparatorTableViewCell_Coins];
}

-(void)setupCellWithGems{
    [self setupCellWithConisAndGemsModel:EnumSeparatorTableViewCell_Gems];
}

-(void)setCoinsAndGemsLabel:(NSInteger)tempGoldsOrGems{
    if ( [self.textField_First.text isEqualToString:@""] ||
         self.textField_First.text == nil ||
         self.textField_First == nil ) {
        return;
    }
    else{
        [self.textLabel_Second setText:[NSString stringWithFormat:@"%ld",(long)tempGoldsOrGems]];
    }
}

#pragma mark - 私有方法
-(void)setupCellWithConisAndGemsModel:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType{
    
    [self createBackgroundViewWithType:tempCoinsAndGemsCellType];
    
    [self createTextFieldWithType:tempCoinsAndGemsCellType];
    
    [self createLabel];
    
    [self createResultLabelWithType:tempCoinsAndGemsCellType];
}

#pragma mark - UI
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
        {
            UIColor *color = [UIColor yellowColor];
            self.textField_First.frame = CGRectMake(10, 48, 110, 54);
            [self.textField_First setTextColor:color];
            self.textField_First.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"?"
                                                                                         attributes:@{NSForegroundColorAttributeName:color}];
        }
            break;
        case EnumSeparatorTableViewCell_Gems:
        {
            UIColor *color = [UIColor colorWithRed:0.38f green:0.58f blue:0.82f alpha:1.0f];
            self.textField_First.frame = CGRectMake(10, 48, 98, 54);
            [self.textField_First setTextColor:color];
            self.textField_First.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"?"
                                                                                         attributes:@{NSForegroundColorAttributeName:color}];
        }
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
    if ( self.textLabel_First == nil ) {
        self.textLabel_First = [[UILabel alloc] init];
    }
    // TODO: 將幾秒鐘的值請 viewController 使用 user default 來取得
    self.textLabel_First.text = [NSString stringWithFormat:@"每 %d 秒鐘自動詢問一次" , 5];
    [self.textLabel_First setFont:[UIFont boldSystemFontOfSize:14.0f]];
    self.textLabel_First.frame = CGRectMake(10, 5, self.frame.size.width - 20, 30);
    [self.textLabel_First setBackgroundColor:[UIColor clearColor]];
    [self.textLabel_First setTextColor:[UIColor whiteColor]];
    [self.textLabel_First setTextAlignment:(NSTextAlignmentRight)];
    self.textLabel_First.numberOfLines = 0;
    [self addSubview:self.textLabel_First];
}

-(void)createResultLabelWithType:(EnumSeparatorTableViewCell)tempCoinsAndGemsCellType{
    if ( self.textLabel_Second == nil ) {
        self.textLabel_Second = [[UILabel alloc] init];
    }
    switch (tempCoinsAndGemsCellType) {
        case EnumSeparatorTableViewCell_Coins:
        {
            self.textLabel_Second.frame = CGRectMake(195, 48, 82, 54);
            [self.textLabel_Second setTextColor:[UIColor colorWithRed:0.38f green:0.58f blue:0.82f alpha:1.0f]];
        }
            break;
        case EnumSeparatorTableViewCell_Gems:
        {
            self.textLabel_Second.frame = CGRectMake(195, 48, 96, 54);
            [self.textLabel_Second setTextColor:[UIColor yellowColor]];
        }
            break;
        default:
            break;
    }
    
    [self.textLabel_Second setBackgroundColor:[UIColor clearColor]];
    [self.textLabel_Second setText:@"0"];
    [self.textLabel_Second setFont:[UIFont boldSystemFontOfSize:40.0f]];
    [self.textLabel_Second setAdjustsFontSizeToFitWidth:YES];
    [self.textLabel_Second setTextAlignment:(NSTextAlignmentRight)];
    
    [self addSubview:self.textLabel_Second];
}

#pragma mark - Select Cell
-(void)selectedCoinsCell:(BOOL)isSelected{
    if ( self.isDoSomething_First == NO &&
         ![self.textField_First.text isEqualToString:@""] ) {
        self.isDoSomething_First = YES;
        if ( self.request_First == nil ) {
            self.request_First = (GW2_Request_Coins *)[[GW2_Request_Coins alloc] initWithDelegate:self];
        }
        [self.request_First setGold:[self.textField_First.text integerValue]];
        [self.request_First sendRequest];
    }
}

-(void)selectedGemsCell:(BOOL)isSelected{
    if ( self.isDoSomething_First == NO &&
         ![self.textField_First.text isEqualToString:@""] ) {
        self.isDoSomething_First = YES;
        if ( self.request_Second == nil ) {
            self.request_Second = [(GW2_Request_Gems *)[GW2_Request_Gems alloc] initWithDelegate:self];
        }
        [self.request_Second setGems:[self.textField_First.text integerValue]];
        [self.request_Second sendRequest];
    }
}

#pragma mark - Coins Request 的 Delegate
-(void)gotCoinsRequestSuccessWithDic:(GW2_WebApi_Coins_Result *)tempCoinsResult{
    [self.textLabel_Second setText:[NSString stringWithFormat:@"%lld" , tempCoinsResult.quantity]];
    self.isDoSomething_First = NO;
}

-(void)gotCoinsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    self.isDoSomething_First = NO;
}

#pragma mark - Gems Request 的 Delegate
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult{
    [self.textLabel_Second setText:[NSString stringWithFormat:@"%d" , (int)(tempGemsResult.quantity/10000)]];
    self.isDoSomething_First = NO;
}

-(void)gotGemsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    self.isDoSomething_First = NO;
}

@end
