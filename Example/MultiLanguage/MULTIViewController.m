//
//  MULTIViewController.m
//  MultiLanguage
//
//  Created by lan_mailbox@163.com on 10/22/2020.
//  Copyright (c) 2020 lan_mailbox@163.com. All rights reserved.
//

#import "MULTIViewController.h"

#import <MultiLanguage/Multi_language.h>
@interface MULTIViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentLanguageLabel;

@end

@implementation MULTIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"此处文字是代码映射的多语言".multi;
    NSArray * languages = [NSLocale preferredLanguages];
    NSString *language = languages.firstObject;
    if ([language hasPrefix:@"zh-"]) {

        self.currentLanguageLabel.text = @"当前手机语言为中文";
    }
    else if ([language hasPrefix:@"ja-"]) {

        self.currentLanguageLabel.text = @"当前手机语言为日文";
    }
    else{

        self.currentLanguageLabel.text = @"当前手机语言为英文";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
