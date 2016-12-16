//
//  MainViewController.m
//  AppXYZ
//
//  Created by XuJiahua on 2016/12/16.
//  Copyright © 2016年 johntech. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblCode;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblCode.text = self.grantCode;
    // 可以用该APP的服务端
    // TODO: OAuth /token: client_id, client_secret, code
    
    // 客户端拿着accessToken就能一直访问资源了，直到过期。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
