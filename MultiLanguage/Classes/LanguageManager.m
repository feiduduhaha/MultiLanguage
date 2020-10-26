//
//  LanguageManager.m
//  MultiLanguage
//
//  Created by silence on 2020/10/22.
//

#import "LanguageManager.h"

static NSString *_languageType = nil;
static NSDictionary *_languageDic = nil;

@implementation LanguageManager
@dynamic languageType;

+ (void)initialize{
    
    _languageType = @"zh_CN";
}

+ (NSString *)languageType{
    return _languageType;
}

+ (void)setLanguageType:(NSString*)languageType{
    _languageType = languageType;
}

+ (NSString *)getCurrentLanguageTextWith:(NSString *)oriStr{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!_languageDic) {
            
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"multi-language" ofType:@"json"];
            NSError * err = nil;
            NSString *jsonStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&err];
            if (err) {
                
                NSLog([NSString stringWithFormat:@"\n************************************************************\n获取json多语言配置文件失败 :%@ \n************************************************************\n",err.description]);
            }else{
                
                NSData *jaonData   = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
                if (jaonData) {
                    
                    _languageDic = [NSJSONSerialization JSONObjectWithData:jaonData options:NSJSONReadingMutableContainers error:&err];
                    if (err) {
                        
                        NSLog([NSString stringWithFormat:@"\n************************************************************\n多语言配置文件解析失败 :%@ \n************************************************************\n",err.description]);
                    }
                }
            }
        }
    });
    if (_languageDic) {
        
        NSString * keyStr = [NSString stringWithFormat:@"%@%@%@",@"@\"",oriStr,@"\""];
        NSString * multiStr = _languageDic[keyStr][_languageType];
        return multiStr?:oriStr;
    } else {
        return oriStr;
    }
}

@end
