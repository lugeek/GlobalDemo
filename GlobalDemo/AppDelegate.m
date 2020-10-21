//
//  AppDelegate.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/16.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 1. 删除storyboard
 2. info.plist中删除UIApplicationSceneManifest和UIMainStoryboardFile
 3. 添加window到AppDelegate
 
 https://www.sitepoint.com/localizing-ios-app/
 https://github.com/DarkAngel7/Demos-LanguageSettingsDemo
 https://github.com/zengqingf/iOSAppLanguageSwitch
 https://www.jianshu.com/p/88c1b65e3ddb
 https://www.jianshu.com/p/9d94fbaeafd1
 图片旋转：https://useyourloaf.com/blog/flipping-and-localizing-image-assets/
 localize：https://lokalise.com/product/for-developers
 localize: https://phrase.com/
 apple: https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/Introduction/Introduction.html#//apple_ref/doc/uid/10000171i
 image localize: https://stackoverflow.com/questions/21310819/how-to-localize-the-images-in-images-xcassets
 官方视频：https://developer.apple.com/videos/play/wwdc2019/403/
 教程：https://medium.com/i18n-and-l10n-resources-for-developers/ios-tutorial-on-internationalization-and-localization-20ed3e9d53e3
 阿拉伯：
 https://www.geek-share.com/detail/2792440678.html
 https://juejin.im/post/6844903832011407367
 http://www.cocoachina.com/articles/22964
 https://xiaovv.me/2017/06/11/Change-Localization-Internally-IniOS-Application/
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    self.window.rootViewController = navC;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
