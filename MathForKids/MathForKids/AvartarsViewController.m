//
//  AvartarsViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-18.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "AvartarsViewController.h"
#import "RegisterViewController.h"

@interface AvartarsViewController ()

@end

@implementation AvartarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setButton:button1];
    [button1 setBackgroundImage:[UIImage imageNamed:@"usrImage1"] forState:UIControlStateNormal];
    [self setButton:button2];
    [button2 setBackgroundImage:[UIImage imageNamed:@"usrImage2"] forState:UIControlStateNormal];
    [self setButton:button3];
    [button3 setBackgroundImage:[UIImage imageNamed:@"usrImage3"] forState:UIControlStateNormal];
    [self setButton:button4];
    [button4 setBackgroundImage:[UIImage imageNamed:@"usrImage4"] forState:UIControlStateNormal];
    [self setButton:button5];
    [button5 setBackgroundImage:[UIImage imageNamed:@"usrImage5"] forState:UIControlStateNormal];
    [self setButton:button6];
    [button6 setBackgroundImage:[UIImage imageNamed:@"usrImage6"] forState:UIControlStateNormal];
    
}

-(void)setButton:(UIButton*) but{
    
    [[but layer] setBorderWidth:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"showImage1"]) {
        // do not change the image name, this will affect the local user library
        [[segue destinationViewController] setImgName:@"usrImage1"];
    }else if ([[segue identifier] isEqualToString:@"showImage2"]) {
        [[segue destinationViewController] setImgName:@"usrImage2"];
    }else if ([[segue identifier] isEqualToString:@"showImage3"]) {
        [[segue destinationViewController] setImgName:@"usrImage3"];
    }else if ([[segue identifier] isEqualToString:@"showImage4"]) {
        [[segue destinationViewController] setImgName:@"usrImage4"];
    }else if ([[segue identifier] isEqualToString:@"showImage5"]) {
        [[segue destinationViewController] setImgName:@"usrImage5"];
    }else if ([[segue identifier] isEqualToString:@"showImage6"]) {
        [[segue destinationViewController] setImgName:@"usrImage6"];
    }
    
    
}


@end

