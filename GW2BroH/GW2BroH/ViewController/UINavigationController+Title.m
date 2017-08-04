//
//  UINavigationController+Title.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/7/26.
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
    titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    titleLabel.layer.shadowOffset = CGSizeMake(0, 2);
    titleLabel.layer.shadowOpacity = 1;
    titleLabel.layer.shadowRadius = 2.0;
    titleLabel.clipsToBounds = NO;
    [self.view addSubview:titleLabel];
}

@end
