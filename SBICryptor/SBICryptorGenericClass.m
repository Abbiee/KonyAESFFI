//
//  SBICryptorGenericClass.m
//  SBICryptorFFI
//
//  Created by SBI on 12/02/21.
//

#import "SBICryptorGenericClass.h"

@implementation SBICryptorGenericClass

+ (id)sharedManager {
    static SBICryptorGenericClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

// Encryption Mechanism

-(void)withCallBack:(CallBack*)callBack encryptUserSecret:(NSString*)secretString {
    self.callbackObj = callBack;
    NSData *data = [secretString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *encryptedData = [RNEncryptor encryptData:data
                                           withSettings:kRNCryptorAES256Settings
                                              password:@"SBIYonoLite"
                                                 error:&error];
    
    NSLog(@"encryptedString: %@", [encryptedData base64EncodedStringWithOptions:0]);
    NSString *encryptedString = [encryptedData base64EncodedStringWithOptions:0];
    NSArray * result = [[NSArray alloc] initWithObjects:encryptedString, nil];
    executeClosure(self.callbackObj, result, NO);
   // return [encryptedData base64EncodedStringWithOptions:0];
}

// Decryption Mechanism

- (void)withCallBack:(CallBack*)callBack decryptUserSecret:(NSString*)secretString {
    self.callbackObj = callBack;
    NSString *base64Encoded = secretString;
    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
    NSError *error;
    NSData *decryptedData = [RNDecryptor decryptData:nsdataFromBase64String
                                        withPassword:@"SBIYonoLite"
                                            error:&error];
    NSLog(@"decryptedString: %@", [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]);
    NSString *decryptedString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    NSArray * result = [[NSArray alloc] initWithObjects:decryptedString, nil];
    executeClosure(self.callbackObj, result, NO);
  //  return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}
@end
