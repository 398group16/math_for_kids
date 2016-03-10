//
//  ScoreViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-28.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController{
    IBOutlet UILabel* label1;
    IBOutlet UILabel* label2;
//    IBOutlet UIButton* home;
    IBOutlet UIButton* share;
    IBOutlet UIButton* compare;
}

@property (strong, nonatomic) NSString* score;
@property (strong, nonatomic) NSString* usrName;

@end
