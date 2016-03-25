//
//  ChangeViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeViewController : UIViewController{
    IBOutlet UIButton* button1;
    IBOutlet UIButton* button2;
    IBOutlet UIButton* button3;
    IBOutlet UIButton* button4;
    IBOutlet UIButton* button5;
    IBOutlet UIButton* button6;
}

@property (strong,nonatomic) NSString* user_name;

-(IBAction)button1action:(id)sender;
-(IBAction)button2action:(id)sender;
-(IBAction)button3action:(id)sender;
-(IBAction)button4action:(id)sender;
-(IBAction)button5action:(id)sender;
-(IBAction)button6action:(id)sender;

@end
