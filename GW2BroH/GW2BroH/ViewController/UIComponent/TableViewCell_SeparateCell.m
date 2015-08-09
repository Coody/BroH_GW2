//
//  TableViewCell_SeparateCell.m
//  GW2BroH
//
//  Created by Coody on 2015/7/21.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "TableViewCell_SeparateCell.h"

// for Category
#import "TableViewCell_SeparateCell+WorldBossCell.h"
#import "TableViewCell_SeparateCell+CoinsAndGems.h"

// for Tools
#import "GW2BroH_Tools.h"


@interface TableViewCell_SeparateCell()

@property (nonatomic , strong) NSTimer *countTimer;

@end

@implementation TableViewCell_SeparateCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self != nil ) {
        _cellType = EnumSeparatorTableViewCell_None;
        _isSelectCell = NO;
//        _isDoSomething_First = NO;
//        _isDoSomething_Second = NO;
        
        self.frame = CGRectMake(0, 0,
                                [UIScreen mainScreen].bounds.size.width,
                                D_CellHight_Normal);
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    }
    return self;
}

-(void)setupCell:(id)tempModel withType:(EnumSeparatorTableViewCell)tempEnumSeparatorTableViewCell{
    
//    // 判斷 Cell type 是否相同，相同不處理，只替換內部顯示內容；不同才要 Clear
//    if ( _cellType != tempEnumSeparatorTableViewCell ) {
//        [self clear];
//    }
    [self clear];
    
    switch (tempEnumSeparatorTableViewCell) {
        case EnumSeparatorTableViewCell_WorldBoss:
        {
            _cellType = EnumSeparatorTableViewCell_WorldBoss;
            
            [self setupCellWithWorldBossModel:tempModel];
        }
            break;
        case EnumSeparatorTableViewCell_Coins:
        {
            _cellType = EnumSeparatorTableViewCell_Coins;
            [self setupCellWithConis];
        }
            break;
        case EnumSeparatorTableViewCell_Gems:
        {
            _cellType = EnumSeparatorTableViewCell_Gems;
            [self setupCellWithGems];
        }
            break;
        case EnumSeparatorTableViewCell_None:
        default:
        {
            _cellType = EnumSeparatorTableViewCell_None;
        }
            break;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setIsSelectCell:(BOOL)isSelectCell{
    [self setIsSelectCell:isSelectCell withAnimation:YES];
}

-(void)setIsSelectCell:(BOOL)isSelectCell withAnimation:(BOOL)isAnimate{
    if ( isSelectCell ) {
        if ( isAnimate ) {
            __weak __typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.3f animations:^{
                __strong __typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.cellBoundImageView.frame = CGRectMake(8,
                                                                 10,
                                                                 [UIScreen mainScreen].bounds.size.width - 10,
                                                                 D_CellHight_Selected - 10);
            }];
        }
        else{
            self.cellBoundImageView.frame = CGRectMake(8,
                                                       10,[UIScreen mainScreen].bounds.size.width - 10,
                                                       D_CellHight_Selected - 10);
        }
    }
    else{
        if ( isAnimate ) {
            __weak __typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.3f animations:^{
                __strong __typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.cellBoundImageView.frame = CGRectMake(8,
                                                                 10,
                                                                 [UIScreen mainScreen].bounds.size.width - 10,
                                                                 D_CellHight_Normal - 10);
            }];
        }
        else{
            self.cellBoundImageView.frame = CGRectMake(8,
                                                       10,
                                                       [UIScreen mainScreen].bounds.size.width - 10,
                                                       D_CellHight_Normal - 10);
        }
    }
    
    switch (_cellType) {
        case EnumSeparatorTableViewCell_WorldBoss:
        {
            [self selectedWorldBossCell:isSelectCell];
        }
            break;
        case EnumSeparatorTableViewCell_Coins:
        {
            [self selectedCoinsCell:YES];
        }
            break;
        case EnumSeparatorTableViewCell_Gems:
        {
            [self selectedGemsCell:YES];
        }
            break;
        case EnumSeparatorTableViewCell_None:
        default:
            break;
    }
}

-(void)clear{
    /*
     每次的 View 不同的時候要來這裡清除
     */
    
    // _cellBoundImageView
    _cellBoundImageView.image = nil;
    _cellBoundImageView.hidden = NO;
    
    // _imageView_First
    [_imageView_First setImage:nil];
    _imageView_First.hidden = NO;
    
    // _textLabel_First
    _textLabel_First.text = nil;
    _textLabel_First.textColor = [UIColor blackColor];
    _textLabel_First.attributedText = nil;
    _textLabel_First.hidden = NO;
    
    // _TextLabel_Second
    _textLabel_Second.text = nil;
    _textLabel_Second.textColor = [UIColor blackColor];
    _textLabel_Second.attributedText = nil;
    _textLabel_Second.hidden = NO;
    
    // _textLabel_Third
    _textLabel_Third.text = nil;
    _textLabel_Third.textColor = [UIColor blackColor];
    _textLabel_Third.attributedText = nil;
    _textLabel_Third.hidden = NO;
    
    // _textField_First
    _textField_First.text = nil;
    _textField_First.textColor = [UIColor blackColor];
    _textField_First.attributedText = nil;
    _textField_First.placeholder = nil;
    _textField_First.hidden = NO;
    _textField_First.backgroundColor = [UIColor clearColor];
    
    // _loadingView
    [_loadingView stopAnimating];
}

-(void)isFirstCell{
    // TODO: 跟其他 Cell 有差別（外框顏色變紅色、倒數時間變大）
    [self isFirstWorldBossCell];
}

@end
