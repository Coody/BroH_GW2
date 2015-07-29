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

// for Tools
#import "GW2BroH_Tools.h"


@interface TableViewCell_SeparateCell()

@property (nonatomic , strong) UIImageView *cellBoundImageView;
@property (nonatomic , strong) UIImage *redCellBoundImage;
@property (nonatomic , strong) UIImage *blueCellBoundImage;

@property (nonatomic , strong) NSTimer *countTimer;

@end

@implementation TableViewCell_SeparateCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self != nil ) {
        _cellType = EnumSeparatorTableViewCell_None;
        _isSelectCell = NO;
        
        self.frame = CGRectMake(0, 0,
                                [UIScreen mainScreen].bounds.size.width,
                                D_CellHight_Normal);
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        
        _cellBoundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8,
                                                                            10,
                                                                            [UIScreen mainScreen].bounds.size.width - 10,
                                                                            D_CellHight_Normal - 10)];
        
        // 初始話基礎底圖、以及讓底圖可以擴大
        CGFloat top = 25; // 頂端高度
        CGFloat bottom = 25 ; // 底部高度
        CGFloat left = 10; // 左部寬度
        CGFloat right = 10; // 右部寬度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        _redCellBoundImage = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
        _redCellBoundImage = [_redCellBoundImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        _blueCellBoundImage = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Blue"];
        _blueCellBoundImage = [_blueCellBoundImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        
        [self addSubview:_cellBoundImageView];
    }
    return self;
}

-(void)setupCell:(id)tempModel withType:(EnumSeparatorTableViewCell)tempEnumSeparatorTableViewCell{
    
    [_cellBoundImageView setImage:_blueCellBoundImage];
    
    // 判斷 Cell type 是否相同，相同不處理，只替換內部顯示內容；不同才要 Clear
    if ( _cellType != tempEnumSeparatorTableViewCell ) {
        [self clear];
    }
    
    switch (tempEnumSeparatorTableViewCell) {
        case EnumSeparatorTableViewCell_WorldBoss:
        {
            _cellType = EnumSeparatorTableViewCell_WorldBoss;
            
            [self setupCellWithWorldBossModel:tempModel];
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
        case EnumSeparatorTableViewCell_None:
        default:
            break;
    }
}

-(void)clear{
    /*
    @property (nonatomic , strong) UIImageView *imageView_First;
    @property (nonatomic , strong) UILabel *textLabel_First;
    @property (nonatomic , strong) UILabel *textLabel_Second;
    @property (nonatomic , strong) UILabel *textLabel_Third;
     */
    
    // _imageView_First
    _imageView_First.image = nil;
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
    
}

-(void)isFirstCell{
    // TODO: 跟其他 Cell 有差別（外框顏色變紅色、倒數時間變大）
    [_cellBoundImageView setImage:_redCellBoundImage];
}

@end
