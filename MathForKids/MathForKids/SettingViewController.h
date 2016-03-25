//
//  SettingViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController{
    IBOutlet UIButton* change;
    IBOutlet UIButton* add;
    IBOutlet UIButton* del;
    IBOutlet UIButton* about;
}

@property (strong,nonatomic) NSString* user_name;

-(IBAction)addSelect:(id)sender;
-(IBAction)delSelect:(id)sender;

@end
