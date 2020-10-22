//
//  NSString+multi_language.m
//  VCS
//
//  Created by silence on 2020/10/21.
//  Copyright © 2020 黄登登. All rights reserved.
//

#import "NSString+multi_language.h"
#import "LanguageManager.h"

@implementation NSString (multi_language)

- (NSString *)multi{
    
    return [LanguageManager getCurrentLanguageTextWith:self];
}

@end
