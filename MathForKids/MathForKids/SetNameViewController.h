//
//  SetNameViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetNameViewController : UIViewController{
    IBOutlet UITextField* field1;
    IBOutlet UITextField* field2;
    IBOutlet UIButton* submit;
}

@property (strong,nonatomic) NSString* user_name;
-(IBAction)submitAction:(id)sender;
-(IBAction)dismissKeyboard1:(id)sender;
-(IBAction)dismissKeyboard2:(id)sender;
@end
