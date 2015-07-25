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
    [self createBossImageViewWithImageName:tempWorldBossModel.bossImageName];
    
    [self createBossNameWithString:tempWorldBossModel.bossName];
}

-(void)createBossImageViewWithImageName:(NSString *)tempImageName{
    if ( self.imageView_First == nil ) {
        self.imageView_First = [[UIImageView alloc] init];
        self.imageView_First.layer.masksToBounds = YES;
        self.imageView_First.layer.cornerRadius = 5.0f;
        [self.imageView_First.layer setBorderWidth:1.0f];
        [self.imageView_First.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    }
    else{
        [self.imageView_First setHidden:NO];
    }
    [self.imageView_First setFrame:CGRectMake(20, 21, 140 , 70)];
    [self.imageView_First setImage:[GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:tempImageName]];
    [self addSubview:self.imageView_First];
}

-(void)createBossNameWithString:(NSString *)tempName{
    if ( self.textLabel_First == nil ) {
        self.textLabel_First = [[UILabel alloc] init];
    }
    UIFont *nameFont = [UIFont boldSystemFontOfSize:26.0f];
    CGSize tempSize = FRAME_SIZE(tempName,nameFont);
     if( tempSize.width >= 80.0f ){
         tempSize.width = 80.0f;
     }
    if ( tempSize.height >= self.imageView_First.frame.size.height ) {
        tempSize.height = self.imageView_First.frame.size.height;
    }
    [self.textLabel_First
     setFrame:CGRectMake(self.imageView_First.frame.origin.x + self.imageView_First.frame.size.width + 10,
                         21,
                         tempSize.width,
                         tempSize.height)];
    [self.textLabel_First setText:tempName];
    [self.textLabel_First setTextColor:[UIColor whiteColor]];
    [self.textLabel_First setTextAlignment:(NSTextAlignmentLeft)];
    [self.textLabel_First setFont:nameFont];
    [self addSubview:self.textLabel_First];
}

#pragma mark - Select Cell
-(void)selectedWorldBossCell:(BOOL)isSelected{
    
}

@end
