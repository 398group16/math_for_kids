//
//  GameViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-27.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController{
    IBOutlet UILabel* kind;
    IBOutlet UILabel* time;
    IBOutlet UIView* imageField;
    IBOutlet UITextView* question;
    IBOutlet UIButton* button1;
    IBOutlet UIButton* button2;
    IBOutlet UIButton* button3;
    IBOutlet UIButton* button4;
    IBOutlet UIButton* next;
    NSTimer* timer;
}
@property (strong, nonatomic) NSString* name;

-(IBAction)button1action:(id)sender;
-(IBAction)button2action:(id)sender;
-(IBAction)button3action:(id)sender;
-(IBAction)button4action:(id)sender;
-(IBAction)nextAction:(id)sender;

@end
