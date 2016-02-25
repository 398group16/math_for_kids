//
//  ViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-24.
//  Copyright (c) 2016 398group16. All rights reserved.
//
#include <math.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)toSignUp:(id)sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[liButton layer] setCornerRadius:4.0f];
    [[liButton layer] setBorderWidth:1.0f];
    [[liButton layer] setBorderColor:[UIColor lightGrayColor].CGColor];
//    [[liButton layer] setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    
    
    usrImage1.layer.cornerRadius = 45;
    usrImage1.layer.borderWidth = 1.0f;
    usrImage1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage1.layer.masksToBounds = YES;
    
    usrImage2.layer.cornerRadius = 45;
    usrImage2.layer.borderWidth = 1.0f;
    usrImage2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage2.layer.masksToBounds = YES;
    
    usrImage3.layer.cornerRadius = 45;
    usrImage3.layer.borderWidth = 1.0f;
    usrImage3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage3.layer.masksToBounds = YES;
    
//    [skip release];
    
}

-(IBAction)skipView:(id)sender{
    HomesViewController* myViewController = [[ HomesViewController alloc ] initWithNibName:@"HomesViewController" bundle: nil ];
    
    UINavigationController* enclosingNav = [ [ UINavigationController alloc ] initWithRootViewController: myViewController ];
    
    [ self presentViewController: enclosingNav animated: YES
                      completion: nil ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
