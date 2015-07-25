//
//  UINavigationController+Title.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/7/26.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "UINavigationController+Title.h"

#import "Constants.h"

@implementation UINavigationController (Title)

-(void)setTitleWithString:(NSString *)tempTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.5 - 120, 10, 240, 60)];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setText:tempTitle];
    [titleLabel setTextAlignment:(NSTextAlignmentCenter)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:26.0f]];
    [self.view addSubview:titleLabel];
}

@end
