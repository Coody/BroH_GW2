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
//#import <Foundation/Foundation.h>

// for Website
#import "GW2_WebApi_Gems.h"

// for USer Default
#define KEY_FOR_GOLD_TIME @"KEY_FOR_GOLD_TIME"
#define KEY_FOR_GOLD @"KEY_FOR_GOLD"
#define KEY_FOR_GOLD_EXCHANGE_GEM @"KEY_FOR_GOLD_EXCHANGE_GEM"
#define KEY_FOR_GEM_TIME @"KEY_FOR_GEM_TIME"
#define KEY_FOR_GEM  @"KEY_FOR_GEM"
#define KEY_FOR_GEM_EXCHANGE_GOLD @"KEY_FOR_GEM_EXCHANGE_GOLD"

@implementation TableViewCell_SeparateCell (CoinsAndGems)

//CATEGORY_PROPERTY_GET_SET(GW2_Request_Coins*,coinsRequest, setCoinsRequest:)
#pragma mark - 開放方法
-(void)setupCellWithConis{
    [self setupCellWithConisAndGemsModel];
}

-(void)setupCellWithGems{
    [self setupCellWithConisAndGemsModel];
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

-(void)setIsDoSomething_First:(BOOL)isDoSomething_First{
    if ( isDoSomething_First == YES ) {
        [self.loadingView startAnimating];
    }
    else{
        [self.loadingView stopAnimating];
    }
}

#pragma mark - 私有方法
-(void)setupCellWithConisAndGemsModel{
    [self createBackgroundView];
    [self createTextField];
    [self createLabel];
    [self createResultLabel];
    [self createLoadingView];
}

// 處理 user default
-(NSInteger)getDefaultGoldOrGem{
    if ( self.cellType == EnumSeparatorTableViewCell_Coins ) {
        return [[NSUserDefaults standardUserDefaults] integerForKey:KEY_FOR_GOLD];
    }
    else{
        return [[NSUserDefaults standardUserDefaults] integerForKey:KEY_FOR_GEM];
    }
}

-(void)setDefaultGoldOrGem:(NSInteger)tempGoldOrGem{
    // 儲存 Gold or Gem
    [[NSUserDefaults standardUserDefaults] setInteger:tempGoldOrGem
                                               forKey:( self.cellType == EnumSeparatorTableViewCell_Coins ? KEY_FOR_GOLD:KEY_FOR_GEM)];
}

-(NSInteger)getDefaultExchange{
    if ( self.cellType == EnumSeparatorTableViewCell_Coins ) {
        return [[NSUserDefaults standardUserDefaults] integerForKey:KEY_FOR_GOLD_EXCHANGE_GEM];
    }
    else{
        return ([[NSUserDefaults standardUserDefaults] integerForKey:KEY_FOR_GEM_EXCHANGE_GOLD]/10000);
    }
}

-(void)setDefaultExchange:(NSInteger)tempExchangeNumber{
    // 儲存時間
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date]
                                              forKey:( self.cellType == EnumSeparatorTableViewCell_Coins ? KEY_FOR_GOLD_TIME:KEY_FOR_GEM_TIME)];
    
    // 儲存更換後的 Gold or Gem
    [[NSUserDefaults standardUserDefaults] setInteger:tempExchangeNumber
                                               forKey:( self.cellType == EnumSeparatorTableViewCell_Coins ? KEY_FOR_GOLD_EXCHANGE_GEM:KEY_FOR_GEM_EXCHANGE_GOLD )];
}

-(NSString *)getTime{
    NSMutableString *mutableTime = [[NSMutableString alloc] init];
    NSDate *tempDate = [[NSUserDefaults standardUserDefaults] objectForKey:( self.cellType == EnumSeparatorTableViewCell_Coins ? KEY_FOR_GOLD_TIME:KEY_FOR_GEM_TIME)];
    if ( tempDate == nil ) {
        [mutableTime setString:@"更新時間：?"];
    }
    else{
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"更新時間：yyyy/MM/dd HH:mm:ss"];
        [mutableTime setString:[dateFormat stringFromDate:tempDate]];
    }
    
    return [mutableTime copy];
}

#pragma mark - UI
-(void) createBackgroundView{
    if ( self.imageView_First == nil ) {
        self.imageView_First = [[UIImageView alloc] init];
    }
    self.imageView_First.frame = CGRectMake(0, 0, self.frame.size.width, 110);
    switch ( self.cellType ) {
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

-(void)createTextField{
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    if ( self.textField_First == nil ) {
        self.textField_First = [[UITextField alloc] init];
        [self addSubview:self.textField_First];
    }
    switch ( self.cellType ) {
        case EnumSeparatorTableViewCell_Coins:
        {
            UIColor *color = [UIColor yellowColor];
            self.textField_First.frame = CGRectMake(self.frame.size.width*0.026,
                                                    48,
                                                    self.frame.size.width*0.3,
                                                    54);
            [self.textField_First setTextColor:color];
            self.textField_First.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"?"
                                                                                         attributes:@{NSForegroundColorAttributeName:color}];
        }
            break;
        case EnumSeparatorTableViewCell_Gems:
        {
            UIColor *color = [UIColor colorWithRed:0.38f green:0.58f blue:0.82f alpha:1.0f];
            self.textField_First.frame = CGRectMake(self.frame.size.width*0.026,
                                                    48,
                                                    self.frame.size.width*0.26,
                                                    54);
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
    
    NSInteger defaultValue = [self getDefaultGoldOrGem];
    if ( defaultValue != 0 ) {
        [self.textField_First setText:[NSString stringWithFormat:@"%ld" , (long)defaultValue]];
    }
}

-(void)createLabel{
    if ( self.textLabel_First == nil ) {
        self.textLabel_First = [[UILabel alloc] init];
        self.textLabel_First.numberOfLines = 0;
        [self addSubview:self.textLabel_First];
    }
    
    // TODO: 將幾秒鐘的值請 viewController 使用 user default 來取得
    self.textLabel_First.text = [self getTime];
    [self.textLabel_First setFont:[UIFont boldSystemFontOfSize:14.0f]];
    self.textLabel_First.frame = CGRectMake(10, 5, self.frame.size.width - 20, 30);
    [self.textLabel_First setBackgroundColor:[UIColor clearColor]];
    [self.textLabel_First setTextColor:[UIColor whiteColor]];
    [self.textLabel_First setTextAlignment:(NSTextAlignmentRight)];
    
}

-(void)createLoadingView{
    if ( self.loadingView == nil ) {
        self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
    self.loadingView.center = self.center;
    [self addSubview:self.loadingView];
}

-(void)createResultLabel{
    if ( self.textLabel_Second == nil ) {
        self.textLabel_Second = [[UILabel alloc] init];
    }
    switch ( self.cellType ) {
        case EnumSeparatorTableViewCell_Coins:
        {
            self.textLabel_Second.frame = CGRectMake(self.frame.size.width*0.52,
                                                     48,
                                                     self.frame.size.width*0.22,
                                                     54);
            [self.textLabel_Second setTextColor:[UIColor colorWithRed:0.38f green:0.58f blue:0.82f alpha:1.0f]];
        }
            break;
        case EnumSeparatorTableViewCell_Gems:
        {
            self.textLabel_Second.frame = CGRectMake(self.frame.size.width*0.52,
                                                     48,self.frame.size.width*0.256,
                                                     54);
            [self.textLabel_Second setTextColor:[UIColor yellowColor]];
        }
            break;
        default:
            break;
    }
    
    [self.textLabel_Second setBackgroundColor:[UIColor clearColor]];
    [self.textLabel_Second setText:[NSString stringWithFormat:@"%d",(int)[self getDefaultExchange]]];
    [self.textLabel_Second setFont:[UIFont boldSystemFontOfSize:40.0f]];
    [self.textLabel_Second setTextAlignment:(NSTextAlignmentRight)];
    [self.textLabel_Second setAdjustsFontSizeToFitWidth:YES];
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
        NSInteger sendGold = [self.textField_First.text integerValue];
        [self.request_First setGold:sendGold];
        [self.request_First sendRequest];
        [self setDefaultGoldOrGem:sendGold];
    }
    else if( [self.textField_First.text isEqualToString:@""] ){
        // 提示使用者要在 ? 輸入數字
        [self showEnterCoinOrGemsNumberAlert];
    }
}

-(void)selectedGemsCell:(BOOL)isSelected{
    if ( self.isDoSomething_First == NO &&
        ![self.textField_First.text isEqualToString:@""] ) {
        self.isDoSomething_First = YES;
        if ( self.request_Second == nil ) {
            self.request_Second = [(GW2_Request_Gems *)[GW2_Request_Gems alloc] initWithDelegate:self];
        }
        NSInteger sendGem = [self.textField_First.text integerValue];
        [self.request_Second setGems:sendGem];
        [self.request_Second sendRequest];
        [self setDefaultGoldOrGem:sendGem];
    }
    else if( [self.textField_First.text isEqualToString:@""] ){
        // 提示使用者要在 ? 輸入數字
        [self showEnterCoinOrGemsNumberAlert];
    }
}

-(void)showEnterCoinOrGemsNumberAlert{
    NSString *showString = @"";
    switch (self.cellType) {
        case EnumSeparatorTableViewCell_Coins:
            showString = @"請點擊 Gold 前面的 ? 來輸入數字！";
            break;
        case EnumSeparatorTableViewCell_Gems:
            showString = @"請點擊 Gems 前面的 ? 來輸入數字！";
        default:
            break;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"錯誤!!"
                                                    message:showString
                                                   delegate:nil
                                          cancelButtonTitle:@"確定"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Coins Request 的 Delegate
-(void)gotCoinsRequestSuccessWithDic:(GW2_WebApi_Coins_Result *)tempCoinsResult{
    [self setDefaultExchange:tempCoinsResult.quantity];
    [self.textLabel_Second setText:[NSString stringWithFormat:@"%lld" , tempCoinsResult.quantity]];
    [self.textLabel_First setText:[self getTime]];
    self.isDoSomething_First = NO;
}

-(void)gotCoinsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    self.isDoSomething_First = NO;
}

#pragma mark - Gems Request 的 Delegate
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult{
    [self setDefaultExchange:tempGemsResult.quantity];
    [self.textLabel_Second setText:[NSString stringWithFormat:@"%d" , (int)(tempGemsResult.quantity/10000)]];
    [self.textLabel_First setText:[self getTime]];
    self.isDoSomething_First = NO;
}

-(void)gotGemsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    self.isDoSomething_First = NO;
}

@end