//
//  SBICryptorGenericClass.h
//  SBICryptorFFI
//
//  Created by SBI on 12/02/21.
//

#import <Foundation/Foundation.h>
#import "RNCryptor.h"
#import "RNEncryptor.h"
#import "RNCryptorEngine.h"
#import "RNDecryptor.h"
#import "lglobals.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBICryptorGenericClass : NSObject
@property (nonatomic, retain) CallBack *callbackObj;
+ (id)sharedManager;
- (void)withCallBack:(CallBack*)callBack encryptUserSecret:(NSString*)secretString;
- (void)withCallBack:(CallBack*)callBack decryptUserSecret:(NSString*)secretString;
@end

NS_ASSUME_NONNULL_END
