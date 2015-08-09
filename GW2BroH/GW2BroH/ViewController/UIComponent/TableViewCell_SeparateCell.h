//
//  TableViewCell_SeparateCell.h
//  GW2BroH
//
//  Created by Coody on 2015/7/21.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

// for Request

#define D_CellHight_Normal 112
#define D_CellHight_Selected 440

/**  */
typedef enum : NSInteger{
    EnumSeparatorTableViewCell_None = 0,
    EnumSeparatorTableViewCell_WorldBoss,
    EnumSeparatorTableViewCell_Coins,
    EnumSeparatorTableViewCell_Gems
}EnumSeparatorTableViewCell;


/**
 *
 */
@interface TableViewCell_SeparateCell : UITableViewCell

// basic property
@property (nonatomic , readonly) EnumSeparatorTableViewCell cellType;
@property (nonatomic , readwrite) BOOL isSelectCell;

// for public UI component
@property (nonatomic , strong) UIImageView *cellBoundImageView;
@property (nonatomic , strong) UIImageView *imageView_First;
@property (nonatomic , strong) UIImage *image_First;
@property (nonatomic , strong) UIImage *image_Second;
@property (nonatomic , strong) UILabel *textLabel_First;
@property (nonatomic , strong) UILabel *textLabel_Second;
@property (nonatomic , strong) UILabel *textLabel_Third;
@property (nonatomic , strong) UITextField *textField_First;
@property (nonatomic , strong) UIActivityIndicatorView *loadingView;
// for others public property
@property (nonatomic , assign) BOOL isDoSomething_First;
@property (nonatomic , assign) BOOL isDoSomething_Second;

// for Request
@property (nonatomic , strong) id request_First;
@property (nonatomic , strong) id request_Second;


/***/
-(void)setupCell:(id)tempModel withType:(EnumSeparatorTableViewCell)tempEnumSeparatorTableViewCell;

/** 清除所有 Cell 內的元件設定 */
-(void)clear;

-(void)isFirstCell;

-(void)setIsSelectCell:(BOOL)isSelectCell withAnimation:(BOOL)isAnimate;

@end
