//
//  AdditionViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "AdditionViewController.h"
#import "CountingViewController.h"
#import "SubtractionViewController.h"
#import "ShapeViewController.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    field.editable = NO;
    [[field layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[field layer] setBorderWidth:1.0f];
    
    [[ytv layer] setCornerRadius:4.0f];
    [[ytv layer] setBorderWidth:1.0f];
    [[ytv layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
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
    
    [[Home layer] setCornerRadius:4.0f];
    [[Home layer] setBorderWidth:1.0f];
    [[Home layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    self.navigationItem.title = @"Addition";
}

-(IBAction)toCountView:(id)sender{
//    CountingViewController* myCount = [[CountingViewController alloc] initWithNibName:@"CountingViewController" bundle:nil];
//    
//    [ self.navigationController pushViewController:myCount animated: YES];
    self.navigationItem.title = @"Count";
}

-(IBAction)toAddView:(id)sender{
//    AdditionViewController* myAdd = [[AdditionViewController alloc] initWithNibName:@"AdditionViewController" bundle:nil];
//    
//    [ self.navigationController pushViewController:myAdd animated: YES];
    self.navigationItem.title = @"Addition";
}

-(IBAction)toSubView:(id)sender{
//    SubtractionViewController* mySub = [[SubtractionViewController alloc] initWithNibName:@"SubtractionViewController" bundle:nil];
//    
//    [ self.navigationController pushViewController:mySub animated: YES];
    self.navigationItem.title = @"Subtraction";}

-(IBAction)toShapeView:(id)sender{
//    ShapeViewController* myShape = [[ShapeViewController alloc] initWithNibName:@"ShapeViewController" bundle:nil];
//    
//    [ self.navigationController pushViewController:myShape animated: YES];
    self.navigationItem.title = @"Shapes";}

-(IBAction)toHomeView:(id)sender{
    [ self dismissViewControllerAnimated: YES completion: nil ];
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
