//
//  RegisterViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-16.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController{
    IBOutlet UIImageView* user_img;
    IBOutlet UITextField* user_name;
    IBOutlet UIPickerView* user_favor;
    IBOutlet UIButton* submit;
}

-(IBAction)submit:(id)sender;

@end
