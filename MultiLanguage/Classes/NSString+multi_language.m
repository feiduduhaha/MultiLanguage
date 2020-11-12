//
//  NSString+multi_language.m
//  VCS
//
//  Created by silence on 2020/10/21.
//  Copyright © 2020 黄登登. All rights reserved.
//

#import "NSString+multi_language.h"
#import "Multi_LanguageManager.h"

@implementation NSString (multi_language)

- (NSString *)multi{
    
    return [Multi_LanguageManager getCurrentLanguageTextWith:self];
}

@end
