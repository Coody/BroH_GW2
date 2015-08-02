//
//  TableViewCell_SeparateCell+WorldBossCell.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/7/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell+WorldBossCell.h"

// for Model
#import "WorldBossModel.h"

// for tools
#import "Constants.h"
#import "GW2BroH_Tools.h"

@implementation TableViewCell_SeparateCell (WorldBossCell)

#pragma mark - Setup Cell
-(void)setupCellWithWorldBossModel:(WorldBossModel *)tempWorldBossModel{
    
    // TODO: 設置 view
    [self createBackground];
    
    [self setIsSelectCell:self.isSelectCell withAnimation:NO];
    
    [self createBossImageViewWithImageName:tempWorldBossModel.bossImageName];
    
    [self createBossNameWithString:tempWorldBossModel.bossName];
    
    [self createBriefTextWithString:tempWorldBossModel.brief];
}

-(void)createBackground{
    if ( self.cellBoundImageView == nil ) {
        self.cellBoundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8,
                                                                                10,
                                                                                [UIScreen mainScreen].bounds.size.width - 10,
                                                                                D_CellHight_Normal - 10)];
    }
    
    // 初始話基礎底圖、以及讓底圖可以擴大
    CGFloat top = 25; // 頂端高度
    CGFloat bottom = 25 ; // 底部高度
    CGFloat left = 10; // 左部寬度
    CGFloat right = 10; // 右部寬度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    if ( self.image_First == nil ) {
        self.image_First = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
        self.image_First = [self.image_First resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    }
    if ( self.image_Second == nil ) {
        self.image_Second = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Blue"];
        self.image_Second = [self.image_Second resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    }
    [self.cellBoundImageView setImage:self.image_Second];
    [self addSubview:self.cellBoundImageView];
}

-(void)createBossImageViewWithImageName:(NSString *)tempImageName{
    if ( self.imageView_First == nil ) {
        self.imageView_First = [[UIImageView alloc] init];
        self.imageView_First.layer.shadowColor = [UIColor blackColor].CGColor;
        self.imageView_First.layer.shadowOffset = CGSizeMake(0, 1);
        self.imageView_First.layer.shadowOpacity = 1;
        self.imageView_First.layer.shadowRadius = 1.0;
        self.imageView_First.clipsToBounds = NO;
    }
    else{
        [self.imageView_First setHidden:NO];
    }
    [self.imageView_First setFrame:CGRectMake(20, 22, 146 , 73)];
    [self.imageView_First setImage:[GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:tempImageName]];
    
    [self addSubview:self.imageView_First];
}

-(void)createBossNameWithString:(NSString *)tempName{
    if ( self.textLabel_First == nil ) {
        self.textLabel_First = [[UILabel alloc] init];
        self.textLabel_First.layer.shadowColor = [UIColor blackColor].CGColor;
        self.textLabel_First.layer.shadowOffset = CGSizeMake(0, 1);
        self.textLabel_First.layer.shadowOpacity = 1;
        self.textLabel_First.layer.shadowRadius = 1.0;
        self.textLabel_First.clipsToBounds = NO;
#ifdef D_Dev_Ver
//        [self.textLabel_First setBackgroundColor:[UIColor greenColor]];
#endif
    }
    UIFont *nameFont = [UIFont boldSystemFontOfSize:28.0f];
    CGSize tempSize = FRAME_SIZE(tempName,nameFont);
    if ( tempSize.height >= self.imageView_First.frame.size.height*0.5 ) {
        tempSize.height = self.imageView_First.frame.size.height*0.5;
    }
    [self.textLabel_First
     setFrame:CGRectMake(self.imageView_First.frame.origin.x + self.imageView_First.frame.size.width + 5,
                         15,
                         80,
                         tempSize.height)];
    [self.textLabel_First setText:tempName];
    [self.textLabel_First setTextColor:[UIColor whiteColor]];
    [self.textLabel_First setTextAlignment:(NSTextAlignmentLeft)];
    [self.textLabel_First setFont:nameFont];
    [self.textLabel_First setNumberOfLines:0];
    [self addSubview:self.textLabel_First];
}

-(void)createBriefTextWithString:(NSString *)tempBrief{
    if ( self.textLabel_Second == nil ) {
        self.textLabel_Second = [[UILabel alloc] init];
#ifdef D_Dev_Ver
//        [self.textLabel_Second setBackgroundColor:[UIColor grayColor]];
#endif
    }
    UIFont *briefFont = [UIFont systemFontOfSize:14.0f];
    CGSize tempSize = FRAME_SIZE(tempBrief, briefFont);
    if ( tempSize.width >= 160.0f ) {
        tempSize.width = 160.0f;
    }
    if ( tempSize.height >= self.imageView_First.frame.size.height*0.6 ) {
        tempSize.height = self.imageView_First.frame.size.height*0.6;
    }
    [self.textLabel_Second
     setFrame:CGRectMake(self.textLabel_First.frame.origin.x,
                         self.imageView_First.frame.size.height*0.5+self.imageView_First.frame.origin.y,
                         tempSize.width,
                         tempSize.height)];
    [self.textLabel_Second setText:tempBrief];
    [self.textLabel_Second setTextColor:[UIColor whiteColor]];
    [self.textLabel_Second setTextAlignment:(NSTextAlignmentLeft)];
    [self.textLabel_Second setFont:briefFont];
    [self.textLabel_Second setNumberOfLines:0];
    [self addSubview:self.textLabel_Second];
}

#pragma mark - Select Cell
-(void)selectedWorldBossCell:(BOOL)isSelected{
    if ( self.textLabel_Third == nil ) {
        self.textLabel_Third = [[UILabel alloc] init];
    }
    [self.textLabel_Third setHidden:!isSelected];
    [self addSubview:self.textLabel_Third];
}

-(void)isFirstWorldBossCell{
    // TODO: 跟其他 Cell 有差別（外框顏色變紅色、倒數時間變大）
    [self.cellBoundImageView setImage:self.image_First];
}

@end
