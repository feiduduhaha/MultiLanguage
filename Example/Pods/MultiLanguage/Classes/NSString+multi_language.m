//
//  NSString+multi_language.m
//  VCS
//
//  Created by silence on 2020/10/21.
//  Copyright © 2020 黄登登. All rights reserved.
//

#import "NSString+multi_language.h"

@implementation NSString (multi_language)

- (NSString *)multi{
    
    if ([self isEqualToString:@"我管理的"]) {
        
        return @"managerList";
    }
    return self;
}
@end
