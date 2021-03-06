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
    }else if ([self isKindOfClass:[UIButton class]]){
        
        UIButton * btn = (UIButton *)self;
        [btn setTitle:btn.currentTitle.multi forState:btn.state];
    }
}

+ (void)handleSubViewsStaticText:(UIView *)targetView{
    
    if ([targetView isKindOfClass:[UILabel class]]) {
        
        UILabel * label = (UILabel *)targetView;
        label.text = label.text.multi;
    }else{
       
        for (UIView * subView in targetView.subviews) {
            
            [UIView handleSubViewsStaticText:subView];
        }
    }
}

@end
