//
//  rootViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright (c) 2016 398group16. All rights reserved.
//

#import "rootViewController.h"

@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[signB layer] setCornerRadius:4.0f];
    [[signB layer] setBorderWidth:1.0f];
    [[signB layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    usrImage1.layer.cornerRadius = 45;
    usrImage1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage1.layer.borderWidth = 1.0f;
    
    usrImage2.layer.cornerRadius = 45;
    usrImage2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage2.layer.borderWidth = 1.0f;
    
    usrImage3.layer.cornerRadius = 45;
    usrImage3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage3.layer.borderWidth = 1.0f;
    
    
}

-(IBAction)toSignUpView:(id)sender{
    
}

-(IBAction)imageToHomeView:(id)sender{
    
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([]){
        
    }
}

@end
