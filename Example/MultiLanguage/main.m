//
//  main.m
//  MultiLanguage
//
//  Created by lan_mailbox@163.com on 10/22/2020.
//  Copyright (c) 2020 lan_mailbox@163.com. All rights reserved.
//

@import UIKit;
#import "MULTIAppDelegate.h"
#import <MultiLanguage/Multi_LanguageManager.h>
int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        NSArray * languages = [NSLocale preferredLanguages];
        NSString *language = languages.firstObject;
        if ([language hasPrefix:@"zh-"]) {

            Multi_LanguageManager.languageType = @"zh_CN";
        }
        else if ([language hasPrefix:@"ja-"]) {

            Multi_LanguageManager.languageType = @"ja_JP";
        }
        else{

            Multi_LanguageManager.languageType = @"en_GB";
        }
        NSString * VCSMainPlistPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
        [Multi_LanguageManager addMulitLanguageJsonFilePath:VCSMainPlistPath];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([MULTIAppDelegate class]));
    }
}
