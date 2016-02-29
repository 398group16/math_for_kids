//
//  ScoreViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-28.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "ScoreViewController.h"
#import "scoreObjects.h"

@interface ScoreViewController (){
    NSMutableArray* scoreArr;
}
@property scoreObjects* scoreObj;

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[home layer] setCornerRadius:4.0f];
    [[home layer] setBorderWidth:1.0f];
    [[home layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[share layer] setCornerRadius:4.0f];
    [[share layer] setBorderWidth:1.0f];
    [[share layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[compare layer] setCornerRadius:4.0f];
    [[compare layer] setBorderWidth:1.0f];
    [[compare layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [label2 setFont:[UIFont boldSystemFontOfSize:27]];
    label2.text = [NSString stringWithFormat:@"%@", self.score];
    [label2 setFont:[UIFont boldSystemFontOfSize:21]];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    self.scoreObj.usrName = _usrName;
    self.scoreObj.score = 10;
    
    
    
    
}

-(void)setCategoryG:(NSString *)newCategory{
    NSLog(@"%@", newCategory);
    if(_category != newCategory){
        _category = newCategory;
    }
}

-(void)setUsrName:(NSString*)newName{
    NSLog(@"%@", newName);
    if(_usrName != newName){
        _usrName = newName;
    }
}

- (void)setScore:(NSString*)newScore{
    NSLog(@"%@", newScore);
    if (_score != newScore) {
        _score = newScore;
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
