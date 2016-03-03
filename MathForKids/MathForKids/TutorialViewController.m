//
//  TutorialViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "TutorialViewController.h"
#import "TutDetailViewController.h"


@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[field layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[field layer] setBorderWidth:1.0f];
        
    [[Count layer] setCornerRadius:4.0f];
    [[Count layer] setBorderWidth:1.0f];
    [[Count layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[add layer] setCornerRadius:4.0f];
    [[add layer] setBorderWidth:1.0f];
    [[add layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[sub layer] setCornerRadius:4.0f];
    [[sub layer] setBorderWidth:1.0f];
    [[sub layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[shape layer] setCornerRadius:4.0f];
    [[shape layer] setBorderWidth:1.0f];
    [[shape layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
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
    TutDetailViewController* dest = segue.destinationViewController;
    if ([[segue identifier] isEqualToString:@"countDetail"]) {
        dest.title = @"Counting";
    }else if ([[segue identifier] isEqualToString:@"addDetail"]){
        dest.title = @"Addition";
    }else if ([[segue identifier] isEqualToString:@"subDetail"]){
        dest.title = @"Subtraction";
    }else if ([[segue identifier] isEqualToString:@"shapeDetail"]){
        dest.title = @"Shape";
    }
}


@end
