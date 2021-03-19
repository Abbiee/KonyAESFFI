//
//  SBICryptorGenericClass.m
//  SBICryptorFFI


#import "SBICryptorGenericClass.h"

@implementation SBICryptorGenericClass

// added from the SLACK discussion, my theory, at the moment, is that you're missing an initializer in your class, so [[self alloc] init] is actually instantiating an empty NSObject, not an instance of your class

-(instancetype)init {
    self = [super init];
    return self;
}

+ (id)sharedManager {
    static SBICryptorGenericClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

// Encryption Mechanism

-(NSString *)encryptUserSecret:(NSString*)secretString {
   // self.callbackObj = callBack;
    NSData *data = [secretString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *encryptedData = [RNEncryptor encryptData:data
                                           withSettings:kRNCryptorAES256Settings
                                              password:@"SBIYonoLite"
                                                 error:&error];
    
    NSLog(@"encryptedString: %@", [encryptedData base64EncodedStringWithOptions:0]);
    NSString *encryptedString = [encryptedData base64EncodedStringWithOptions:0];
    NSArray * result = [[NSArray alloc] initWithObjects:encryptedString, nil];
  //  executeClosure(self.callbackObj, result, NO);
    return [encryptedData base64EncodedStringWithOptions:0];
}

// Decryption Mechanism

- (NSString *)decryptUserSecret:(NSString*)secretString {
  //  self.callbackObj = callBack;
    NSString *base64Encoded = secretString;
    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
    NSError *error;
    NSData *decryptedData = [RNDecryptor decryptData:nsdataFromBase64String
                                        withPassword:@"SBIYonoLite"
                                            error:&error];
    NSLog(@"decryptedString: %@", [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]);
    NSString *decryptedString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    if ([decryptedString length] != 0) {
        BOOL isDecrypted = YES;
        NSArray * result = [[NSArray alloc] initWithObjects: @(isDecrypted), nil];
    //    executeClosure(self.callbackObj, result, NO);
    } else {
        BOOL isNotDecrypted = NO;
        NSArray * result = [[NSArray alloc] initWithObjects: @(isNotDecrypted), nil];
      //  executeClosure(self.callbackObj, result, NO);
    }
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}
@end
