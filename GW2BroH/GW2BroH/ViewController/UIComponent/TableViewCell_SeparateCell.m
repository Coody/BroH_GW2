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

@end

@implementation TableViewCell_SeparateCell

-(id)init{
    self = [super init];
    if ( self != nil ) {
        _cellType = EnumSeparatorTableViewCell_None;
        
        self.frame = CGRectMake(0, 0,
                                [UIScreen mainScreen].bounds.size.width,
                                D_CellHight_Normal);
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        
        _cellBoundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,
                                                                            10,
                                                                            [UIScreen mainScreen].bounds.size.width - 20,
                                                                            D_CellHight_Normal - 20)];
        _redCellBoundImage = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
        _blueCellBoundImage = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Blue"];
        [_cellBoundImageView setImage:_blueCellBoundImage];
        [self addSubview:_cellBoundImageView];
    }
    return self;
}

-(void)setupCell:(id)tempModel withType:(EnumSeparatorTableViewCell)tempEnumSeparatorTableViewCell{
    
    // 判斷 Cell type 是否相同，相同不處理，只替換內部顯示內容；不同才要 Clear
    if ( _cellType != tempEnumSeparatorTableViewCell ) {
        [self clear];
    }
    
    switch (tempEnumSeparatorTableViewCell) {
        case EnumSeparatorTableViewCell_None:
        {
            _cellType = EnumSeparatorTableViewCell_WorldBoss;
            
            [self setupCellWithWorldBossModel:tempModel];
        }
            break;
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
