//
//  LocalizeConfig.h
//  GlobalDemo
//
//  Created by lugeek on 2020/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocalizeConfig : NSObject

+ (void)setAppLanguage:(NSString *)language;

+ (void)resetToSystemLanguage;

+ (NSString * _Nullable)appLanguage;

+ (NSString *)systemLanguage;

+ (NSString *)curLanguage;

@end

NS_ASSUME_NONNULL_END
