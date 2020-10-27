//
//  UIView+multi_language.m
//  VCS
//
//  Created by silence on 2020/10/22.
//  Copyright © 2020 黄登登. All rights reserved.
//

#import "UIView+multi_language.h"
#import "NSString+multi_language.h"

@implementation UIView (multi_language)

- (void)awakeFromNib{
    [super awakeFromNib];
    
    if ([self isKindOfClass:[UILabel class]]) {
        
        UILabel * label = (UILabel *)self;
        label.text = label.text.multi;
    }
    else if ([self isKindOfClass:[UITextField class]]){
        
        UITextField * textField = (UITextField *)self;
        textField.placeholder = textField.placeholder.multi;
    }
    else if ([self isKindOfClass:[UITabBar class]]) {
        
        UITabBar * bar = (UITabBar *)self;
        for (UIBarButtonItem * item in bar.items) {
            
            item.title = item.title.multi;
        }
    }
}

@end
