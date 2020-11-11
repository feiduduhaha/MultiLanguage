//
//  LanguageManager.m
//  MultiLanguage
//
//  Created by silence on 2020/10/22.
//

#import "LanguageManager.h"

static NSString *_languageType = nil;
static NSMutableDictionary *_languageDic = nil;

@implementation LanguageManager
@dynamic languageType;

+ (void)initialize{
    
    _languageType = @"zh_CN";
    if (!_languageDic) {
        
        _languageDic = [NSMutableDictionary new];
    }
}

+ (NSString *)languageType{
    return _languageType;
}

+ (void)setLanguageType:(NSString*)languageType{
    _languageType = languageType;
}

+ (void)addMulitLanguageJsonFilePath:(NSString *)filePath{
    
    NSFileManager * fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExist = [fileManger fileExistsAtPath:filePath isDirectory:&isDir];
    if (!isExist) {
        NSLog(@"不存在的多语言映射json文件：%@",filePath);
#ifdef DEBUG
        assert(0);
#endif
    }
    [self getJsonFromFile:filePath];
}

+ (NSString *)getCurrentLanguageTextWith:(NSString *)oriStr{

    if (!oriStr || oriStr.length == 0 || _languageDic.count == 0) {
        
        return oriStr;
    }
    if (_languageDic) {
        
        return _languageDic[oriStr][_languageType]?:oriStr;
    } else {
        return oriStr;
    }
}

+ (void)getJsonFromFile:(NSString *)filePath{
    
    NSDictionary * dic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    if (dic) {
        [_languageDic setValuesForKeysWithDictionary:dic];
    }
}
@end
