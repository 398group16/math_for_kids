//
//  HomeViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "HomeViewController.h"
#import "TutorialViewController.h"
#import "GameCategoryViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    usrImage.layer.cornerRadius = 45;
    usrImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    usrImage.layer.borderWidth = 1.0f;
    
    [[start layer] setCornerRadius:4.0f];
    [[start layer] setBorderWidth:1.0f];
    [[start layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[tut layer] setCornerRadius:4.0f];
    [[tut layer] setBorderWidth:1.0f];
    [[tut layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[score layer] setCornerRadius:4.0f];
    [[score layer] setBorderWidth:1.0f];
    [[score layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[exit layer] setCornerRadius:4.0f];
    [[exit layer] setBorderWidth:1.0f];
    [[exit layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    self.navigationItem.title = @"Menu";
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(handleBack:)];


    self.navigationItem.leftBarButtonItem = backButton;

}

-(void)setUsrName:(NSString*)newName{
    if(_usrName != newName){
        _usrName = newName;
    }
}

-(void)handleBack:(id) sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//-(IBAction)toTutorialView:(id)sender{
//    TutorialViewController* myTut = [[TutorialViewController alloc] initWithNibName:@"TutorialViewController" bundle:nil];
//    
//    UINavigationController* enclosingNav = [ [ UINavigationController alloc ] initWithRootViewController: myTut ];
//    
//    [ self presentViewController: enclosingNav animated: YES
//                      completion: nil ];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"tutDetail"]) {
        TutorialViewController* dest = segue.destinationViewController;
        dest.title = @"Tutorial";
    }else if([[segue identifier] isEqualToString:@"gameCateDetail"]){
        GameCategoryViewController* dest = segue.destinationViewController;
        dest.title = @"Game Category";
        [[segue destinationViewController] setUsrName: _usrName];
    }
}

@end
