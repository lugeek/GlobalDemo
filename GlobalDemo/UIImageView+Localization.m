//
//  UIImageView+Localization.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/20.
//

#import "UIImageView+Localization.h"
#import "NSString+Localization.h"

@implementation UIImageView (Localization)

- (void)localizeImage:(NSString *)imageName
{
    self.image = [UIImage imageNamed:imageName ? imageName.localized : @""];
}

@end
