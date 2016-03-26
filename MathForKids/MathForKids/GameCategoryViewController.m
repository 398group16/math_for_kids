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

- (void)setAnswerButtonLayout:(UIButton*) button{
    
    //    [self setAnswerButtonLayout:(compare)];
    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    myImage.layer.cornerRadius = 45;
//    myImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    myImage.layer.borderWidth = 1.0f;
    
    [myImage setImage:_userImg];
    [usrLabel setText:_usrName];
    
    [self setAnswerButtonLayout:(count)];
    [self setAnswerButtonLayout:(add)];
    [self setAnswerButtonLayout:(sub)];
    [self setAnswerButtonLayout:(shape)];
    
    
    
    self.navigationItem.title = @"Select game category";
}

-(void)setUsrName:(NSString *)newName{
    NSLog(@"name: %@", newName);
    if(_usrName != newName){
        _usrName = newName;
    }
}

-(void)setUserImg:(UIImage*)newImg{
    if(_userImg != newImg){
        _userImg = newImg;
    }
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
        [[segue destinationViewController] setUsr_name:_usrName];
        
    }else if([[segue identifier] isEqualToString:@"addGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Addtion Game";
        [[segue destinationViewController] setCategory:@"Addition"];
        [[segue destinationViewController] setUsr_name:_usrName];
        
    }else if([[segue identifier] isEqualToString:@"subGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Subtraction Game";
        [[segue destinationViewController] setCategory:@"Subtraction"];
        [[segue destinationViewController] setUsr_name:_usrName];
        
    }else if([[segue identifier] isEqualToString:@"shapeGdetail"]){
        GameViewController* dest = segue.destinationViewController;
        dest.title = @"Shape Game";
        [[segue destinationViewController] setCategory:@"Shape"];
        [[segue destinationViewController] setUsr_name:_usrName];
    }
}


@end
