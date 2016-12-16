//
//  ViewController.m
//  AppXYZ
//
//  Created by XuJiahua on 2016/12/15.
//  Copyright © 2016年 johntech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAuthorize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.btnAuthorize addTarget:self action:@selector(authorize:) forControlEvents:UIControlEventTouchUpInside];
}

// unused
- (IBAction)openKeyboard:(id)sender {
}

- (void)authorize: (id )sender{
    NSString *url =@"weixin://authorize.com?callback=xyz://success.authorize.com&client_id=1234&name=某某商务&home=上海市";
    NSString *encoded = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *decoded = [encoded stringByRemovingPercentEncoding];
    
    NSLog(@"%@", encoded);
    NSLog(@"%@", decoded);
    
    // 为了传输中文，一定要对url做encode
    NSURL *myURL = [NSURL URLWithString:encoded];
    
    // 貌似传送不了options数据
    NSMutableDictionary<NSString*,id> *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"hello" forKey:@"key1"];
    
    [[UIApplication sharedApplication] openURL:myURL options:@{} completionHandler:^(BOOL success) {
        NSLog(@"%d", success);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
