//
//  GameCategoryViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-27.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "GameCategoryViewController.h"
#import "GameViewController.h"

@interface GameCategoryViewController ()

@end

@implementation GameCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myImage.layer.cornerRadius = 45;
    myImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    myImage.layer.borderWidth = 1.0f;
    
    [[count layer] setCornerRadius:4.0f];
    [[count layer] setBorderWidth:1.0f];
    [[count layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
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
    if([[segue identifier] isEqualToString:@"countGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Counting Game";
        [[segue destinationViewController] setCategory:@"Counting"];
        
    }else if([[segue identifier] isEqualToString:@"addGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Addtion Game";
        [[segue destinationViewController] setCategory:@"Addition"];
        
    }else if([[segue identifier] isEqualToString:@"subGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Subtraction Game";
        [[segue destinationViewController] setCategory:@"Subtraction"];
        
    }else if([[segue identifier] isEqualToString:@"shapeGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Shape Game";
        [[segue destinationViewController] setCategory:@"Shape"];
    }
}


@end
