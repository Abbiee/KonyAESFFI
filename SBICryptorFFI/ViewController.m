//
//  ViewController.m
//  SBICryptorFFI


#import "ViewController.h"
#import "SBICryptorGenericClass.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *finalEncrytped;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *encryptedString = [[SBICryptorGenericClass sharedManager] encryptUserSecret:@"Created by Abbie on 12/02/21."];
//    NSLog(@"EncryptedString%@", encryptedString);
//    NSString *decryptedString = [[SBICryptorGenericClass sharedManager] decryptUserSecret:encryptedString];
//    NSLog(@"DecryptedString%@", decryptedString);
}
- (IBAction)encryptAction:(id)sender {
        NSString *encryptedString = [[SBICryptorGenericClass sharedManager] encryptUserSecret:@"Created by Abbie on 12/02/21."];
        NSLog(@"EncryptedString%@", encryptedString);
    self.finalEncrytped = encryptedString;
}

- (IBAction)decryptAction:(id)sender {
        NSString *decryptedString = [[SBICryptorGenericClass sharedManager] decryptUserSecret:_finalEncrytped];
       NSLog(@"DecryptedString%@", decryptedString);
}


@end
