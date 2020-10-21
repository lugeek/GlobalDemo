//
//  NSBundle+Localization.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/19.
//

#import "NSBundle+Localization.h"
#import "LocalizeConfig.h"
#import <objc/runtime.h>

@interface LocalizeBundle : NSBundle
@end

@implementation LocalizeBundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    if ([self localizeMainBundle]) {
        return [[self localizeMainBundle] localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}

- (NSBundle *)localizeMainBundle
{
    if ([LocalizeConfig curLanguage].length) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[LocalizeConfig curLanguage] ofType:@"lproj"];
        if (path.length) {
            return [NSBundle bundleWithPath:path];
        }
    }
    return nil;
}

@end

@implementation NSBundle (Localization)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //动态继承、交换，方法类似KVO，通过修改[NSBundle mainBundle]对象的isa指针，使其指向它的子类UWBundle，这样便可以调用子类的方法；其实这里也可以使用method_swizzling来交换mainBundle的实现，来动态判断，可以同样实现。
        object_setClass([NSBundle mainBundle], [LocalizeBundle class]);
    });
}

@end
