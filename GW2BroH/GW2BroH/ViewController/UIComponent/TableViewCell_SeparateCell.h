//
//  TableViewCell_SeparateCell.h
//  GW2BroH
//
//  Created by Coody on 2015/7/21.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell_SeparateCell : UITableViewCell

@property (nonatomic , strong) UIImageView *imageView_First;
@property (nonatomic , strong) UILabel *textLabel_First;
@property (nonatomic , strong) UILabel *textLabel_Second;
@property (nonatomic , strong) UILabel *textLabel_Third;

-(void)clear;

@end
