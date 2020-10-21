//
//  LanguageSettingViewController.m
//  GlobalDemo
//
//  Created by lugeek on 2020/10/19.
//

#import "LanguageSettingViewController.h"
#import "LocalizeConfig.h"
#import "ViewController.h"
#import "NSString+Localization.h"

@interface LanguageSettingViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *languages;

@end

@implementation LanguageSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Language".localized;
    [self.view addSubview:({
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView;
    })];
    self.languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    self.languages = @[@"ja", @"zh-Hans", @"zh-Hant", @"de", @"en", @"ar"];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.languages ? self.languages.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell_id"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.languages[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.F;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *language = self.languages[indexPath.row];
    [[NSUserDefaults standardUserDefaults] setValue:@[@"zh-Hans"] forKey:@"AppleLanguages"];
    [LocalizeConfig setAppLanguage:language];
    
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    NSMutableArray *vcs = nvc.viewControllers.mutableCopy;
    [vcs addObject:[LanguageSettingViewController new]];
    [UIApplication sharedApplication].delegate.window.rootViewController = nvc;
    nvc.viewControllers = vcs;
}

@end
