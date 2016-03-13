//
//  RootViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"

@interface RootViewController (){
    NSString* userName;
}

@end

@implementation RootViewController

- (void)setAnswerButtonLayout:(UIButton*) button{
    
    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
} //    [self setAnswerButtonLayout:(compare)];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[signB layer] setCornerRadius:4.0f];
//    [[signB layer] setBorderWidth:1.0f];
//    [[signB layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [self setAnswerButtonLayout:(signB)];

    
    usrImage1.layer.cornerRadius = 45;
    usrImage1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage1.layer.borderWidth = 1.0f;
    
    usrImage2.layer.cornerRadius = 45;
    usrImage2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage2.layer.borderWidth = 1.0f;
    
    usrImage3.layer.cornerRadius = 45;
    usrImage3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage3.layer.borderWidth = 1.0f;
    
    self.navigationItem.title = @"Math For Kids";
}

-(IBAction)toSignUpView:(id)sender{
    
}

-(IBAction)skipToHomeView:(id)sender{
    HomeViewController* myHome = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    UINavigationController* enclosingNav = [ [ UINavigationController alloc ] initWithRootViewController: myHome ];
    
    [ self presentViewController: enclosingNav animated: YES
                      completion: nil ];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"homeDetail"]) {

        [[segue destinationViewController] setUsrName: userName];
    }
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
