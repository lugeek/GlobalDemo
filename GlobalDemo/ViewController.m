//
//  ViewController.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/16.
//

#import "ViewController.h"
#import "LanguageSettingViewController.h"
#import "UIImageView+Localization.h"
#import "NSString+Localization.h"
#import "NSBundle+Localization.h"
#import "LocalizeConfig.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 切换语言前
//    NSArray *langArr1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
//    NSString *language1 = langArr1.firstObject;
//    NSLog(@"模拟器语言切换之前：%@",language1);
//
//    // 切换语言(pass: 因为这种方式需要APP重启才生效)
//    NSArray *lans = @[@"de-DE"];
//    [[NSUserDefaults standardUserDefaults] setObject:lans forKey:@"AppleLanguages"];
//
//    // 切换语言后
//    NSArray *langArr2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
//    NSString *language2 = langArr2.firstObject;
//    NSLog(@"模拟器语言切换之后：%@",language2);
    
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:label];
    label.text = NSLocalizedString(@"home", @"");
    label.backgroundColor = [UIColor yellowColor];
    
    UILabel *demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [self.view addSubview:demoLabel];
    demoLabel.text = NSLocalizedStringFromTable(@"demoString", @"demo", @"");
    demoLabel.backgroundColor = [UIColor orangeColor];
    
    UIImageView *countryImg = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:countryImg];
    // 1. flag -> flag_xx -> 不同国家图片
//    [countryImg localizeImage:@"flag"];
    // 2. 图片不放在Asset catalog，进行localize，图片会放入到不同国家的bundle中，同一个名字，不同的bundle取不同的图片
    countryImg.image = [UIImage imageNamed:@"flag.jpeg" inBundle:[self localizeMainBundle] withConfiguration:nil];
    
    UIButton *changeLanguage = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 100)];
    [self.view addSubview:changeLanguage];
    [changeLanguage setTitle:NSLocalizedString(@"Language", @"") forState:UIControlStateNormal];
    [changeLanguage setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [changeLanguage addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    changeLanguage.backgroundColor = [UIColor yellowColor];
    
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 500, 300, 100)];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 4;
    
    UILabel *directionLabel = [UILabel new];
    directionLabel.text = @"long text".localized;
    directionLabel.numberOfLines = 2;
    [directionLabel sizeToFit];
    directionLabel.backgroundColor = [UIColor purpleColor];
    
    UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [arrow localizeImage:@"arrow"];
    
    [stackView addArrangedSubview:directionLabel];
    [stackView addArrangedSubview:arrow];
    [self.view addSubview:stackView];
    
    
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

- (void)btnClick:(UIButton *)btn
{
    LanguageSettingViewController *controller = [LanguageSettingViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
