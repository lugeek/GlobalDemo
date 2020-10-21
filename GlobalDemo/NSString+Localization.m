//
//  NSString+Localization.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/21.
//

#import "NSString+Localization.h"

@implementation NSString (Localization)

- (NSString *)localized
{
    return NSLocalizedString(self, @"");
}

@end
