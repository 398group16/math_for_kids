//
//  YoutubeViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-26.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "YoutubeViewController.h"

@interface YoutubeViewController ()

@end

@implementation YoutubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self goHomeInternal];
}

- (void)setDetailItem:(NSString*)newDetailItem {
    NSLog(@"%@", newDetailItem);
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

-(void)goHomeInternal
{
    NSURL* myURL = [ NSURL URLWithString: self.detailItem ];
    
    NSURLRequest* myRequest = [ NSURLRequest requestWithURL: myURL ];
    
    [ myWebView loadRequest: myRequest ];
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
