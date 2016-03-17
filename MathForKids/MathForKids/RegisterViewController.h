//
//  RegisterViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-16.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    IBOutlet UIImageView* user_img;
    IBOutlet UITextField* user_name;
    IBOutlet UIButton* submit;
    
    UIPickerView* user_favor;
    NSMutableArray *source;
}

@property (nonatomic, strong) NSString* imgName;

@property (nonatomic,retain) UIPickerView *user_favor;
@property (nonatomic,retain) NSMutableArray *source;

-(IBAction)submit:(id)sender;

@end
