//
//  Multi_LanguageManager.h
//  MultiLanguage
//
//  Created by silence on 2020/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Multi_LanguageManager : NSObject

@property (class, nonatomic) NSString * languageType;//json表中的语言类型

+ (void)addMulitLanguageJsonFilePath:(NSString *)filePath;
+ (NSString *)getCurrentLanguageTextWith:(NSString *)oriStr;
@end

NS_ASSUME_NONNULL_END
