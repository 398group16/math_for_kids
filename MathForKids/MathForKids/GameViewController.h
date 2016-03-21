//
//  GameViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-27.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController{
    IBOutlet UILabel* time;
//    IBOutlet UIView* imageField;
    IBOutlet UIImageView* imageField;
    IBOutlet UITextView* txtField;
    IBOutlet UITextView* question;
    __weak IBOutlet UIImageView *farmBackground;
    
    //buttons
    IBOutlet UIButton* button1;
    IBOutlet UIButton* button2;
    IBOutlet UIButton* button3;
    IBOutlet UIButton* button4;
    IBOutlet UIButton* next;
    IBOutlet UIButton* finish;
    IBOutlet UIButton* skip;
    
    NSTimer* timer;
}


@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* usr_name;

-(IBAction)button1action:(id)sender;
-(IBAction)button2action:(id)sender;
-(IBAction)button3action:(id)sender;
-(IBAction)button4action:(id)sender;
-(IBAction)nextAction:(id)sender;
-(IBAction)skipAction:(id)sender;


@end
