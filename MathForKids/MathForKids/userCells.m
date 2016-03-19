//
//  userCells.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-19.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "userCells.h"
#import "HomeViewController.h"

@implementation userCells{
    NSString* userName;
    NSString* userImg;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //intialize our data to be stored in the json file
    }
    return self;
}

-(void)loadCellLabel:(NSString *)newName{
    [user_name setText:newName];
    userName = newName;
}
-(void)loadCellImg:(NSString *)newImg{
    UIImage* img = [UIImage imageNamed:newImg];
    [user_img setImage:img];
    userImg = newImg;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"11111");
    if([[segue identifier] isEqualToString:@"homeUserDetail"]){
        
        [[segue destinationViewController] setUsrName: userName];
        [[segue destinationViewController] setUser_img: userImg];
    }
}
@end
