//
//  SBICryptorGenericClass.h
//  SBICryptorFFI

#import <Foundation/Foundation.h>
#import "RNCryptor.h"
#import "RNEncryptor.h"
#import "RNCryptorEngine.h"
#import "RNDecryptor.h"
//#import "lglobals.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBICryptorGenericClass : NSObject
//@property (nonatomic, retain) CallBack *callbackObj;
+ (id)sharedManager;
- (NSString *)encryptUserSecret:(NSString*)secretString;
- (NSString *)decryptUserSecret:(NSString*)secretString;
@end

NS_ASSUME_NONNULL_END
