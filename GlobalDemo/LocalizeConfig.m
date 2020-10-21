//
//  LocalizeConfig.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/19.
//

#import "LocalizeConfig.h"

static NSString *const APP_LOCALIZE_LANGUAGE_KEY = @"AppLocalizeLanguageKey";
static NSString *const SYSTEM_LOCALIZE_LANGUAGE_KEY = @"AppleLanguages";

@implementation LocalizeConfig

+ (void)initLanguage
{
    // 1. 读取APP设置的语言
    // 2. 若APP未设置语言，读取SYSTEM语言
    // 3. SYSTEM语言在APP支持的语言范围内，使用SYSTEM语言作为APP语言
    // 4. SYSTEM语言不在APP支持的语言范围内，使用兜底语言English作为APP语言。
    NSString *appLang = [self appLanguage];
    if (!appLang) {
        NSString *systemLang = NSLocale.preferredLanguages.firstObject;
        //...change
    }
}

+ (void)setAppLanguage:(NSString *)language
{
    if (!language.length) {
        [self resetToSystemLanguage];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setValue:language forKey:APP_LOCALIZE_LANGUAGE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)resetToSystemLanguage
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:APP_LOCALIZE_LANGUAGE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString * _Nullable)appLanguage
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:APP_LOCALIZE_LANGUAGE_KEY];
}

+ (NSString *)systemLanguage
{
    // [NSLocale preferredLanguages].firstObject
    NSArray *languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    return languages ? languages.firstObject : nil;
}

+ (NSString *)curLanguage
{
    NSString *appLanguage = [self appLanguage];
    if (!appLanguage.length) {
        appLanguage = [self systemLanguage];
    }
    return appLanguage;
}

@end
