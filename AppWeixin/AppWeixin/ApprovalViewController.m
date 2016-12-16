//
//  ApprovalViewController.m
//  AppWeixin
//
//  Created by XuJiahua on 2016/12/16.
//  Copyright © 2016年 johntech. All rights reserved.
//

#import "ApprovalViewController.h"

@interface ApprovalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end

@implementation ApprovalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblName.text = self.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)approveAuth:(id)sender {
    // 客户端直接返回accessToken，会有安全问题
    // 对于本APP来说，其他客户端可能会伪造请求获取accessToken
    // 对于使用本APP登录的其他APP来说，openURL可能会跑到恶意APP（与本APP的URL scheme一样）去，伪造登录成功
    
    // TODO: OAuth2.0 /authorize client_id, get grant_code
    int random = arc4random();
    if (random < 0) {
        random = -random;
    }

    self.callback = [self.callback stringByAppendingString:[NSString stringWithFormat:@"?code=%d", random]];
    
    // 对于用户授权，直接返回就好了
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.callback] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"%d", success);
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
