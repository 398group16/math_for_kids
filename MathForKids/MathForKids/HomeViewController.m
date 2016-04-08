//
//  HomeViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "HomeViewController.h"
#import "GameCategoryViewController.h"
#import "ScoreListViewController.h"
#import "SettingViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        //intialize our data to be stored in the json file
//        [self viewDidLoad];
//    }
    return self;
}

- (IBAction)startGameButtonPress:(id)sender {
    
    NSArray *viewControllers = [[self navigationController] viewControllers];
    NSLog(@"Views in the stack at home menu: %@",viewControllers);
}

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
    
    [usrLabel setText:_user_name];
    NSArray *viewControllers = [[self navigationController] viewControllers];
    NSLog(@"Views in the stack at Menu: %@",viewControllers);
    
    self.navigationItem.title = @"Home";
    
    /*
     In addition to removing the back button (using the methods already recommended), don't forget the user can still 'pop' to the previous screen with a left-to-right swipe gesture in iOS 7 and later.
     
     To disable that (when appropriate), implement the following (in viewDidLoad for example):
     
     if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
     self.navigationController.interactivePopGestureRecognizer.enabled = NO;
     */
    
    
    //although rootview is still in UIView array but the registering part is not
    [self.navigationItem setHidesBackButton:YES];
    
//    self.navigationItem.leftBarButtonItem = nil;
    
    
    // Do any additional setup after loading the view from its nib.
//    usrImage.layer.cornerRadius = 45;
//    usrImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    usrImage.layer.borderWidth = 1.0f;
    
//    UIImage* userImg = [UIImage imageNamed:_user_img];
    [usrImage setImage:_user_img];
    
    [self setAnswerButtonLayout:(start)];
    [self setAnswerButtonLayout:(tut)];
    [self setAnswerButtonLayout:(score)];
    [self setAnswerButtonLayout:(exit)];
    
//    
//    [[start layer] setCornerRadius:4.0f];
//    [[start layer] setBorderWidth:1.0f];
//    [[start layer] setBorderColor:[UIColor lightGrayColor].CGColor];
//    
//    [[tut layer] setCornerRadius:4.0f];
//    [[tut layer] setBorderWidth:1.0f];
//    [[tut layer] setBorderColor:[UIColor lightGrayColor].CGColor];
//    
//    [[score layer] setCornerRadius:4.0f];
//    [[score layer] setBorderWidth:1.0f];
//    [[score layer] setBorderColor:[UIColor lightGrayColor].CGColor];
//    
//    [[exit layer] setCornerRadius:4.0f];
//    [[exit layer] setBorderWidth:1.0f];
//    [[exit layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
//    self.navigationItem.title = @"Menu";
//    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(handleBack:)];
//
//
//    self.navigationItem.leftBarButtonItem = backButton;

}

-(void)setUsrName:(NSString*)newName{
    if(_user_name != newName){
        _user_name = newName;
    }
    NSLog(@"user name (home)   : %@", _user_name);
}

-(void)setUser_img:(UIImage*)newImg{
    if(_user_img != newImg){
        _user_img = newImg;
    }
}

//-(void)handleBack:(id) sender{
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}

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

    if([[segue identifier] isEqualToString:@"gameCateDetail"]){
        NSLog(@"%@", _user_name);
        [[segue destinationViewController] setUserImg: _user_img];
        [[segue destinationViewController] setUsrName: _user_name];
        
    }else if([[segue identifier] isEqualToString:@"homeToScore"]){
        ScoreListViewController* dest = segue.destinationViewController;
        [[segue destinationViewController] setUserName: _user_name];
        dest.title = @"Counting";
    }else if([[segue identifier] isEqualToString:@"showSet"]){
        SettingViewController* dest = segue.destinationViewController;
        [[segue destinationViewController] setUser_name: _user_name];
        [[segue destinationViewController] setImg_name: _user_img];
        dest.title = @"Setting";
    }
}

@end
