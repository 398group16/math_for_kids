//
//  rootViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright (c) 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rootViewController : UIViewController{
    IBOutlet UIButton* signB;
    IBOutlet UIImageView* usrImage1;
    IBOutlet UIImageView* usrImage2;
    IBOutlet UIImageView* usrImage3;
    IBOutlet UIBarButtonItem* skip;
}

-(IBAction)imageToHomeView:(id)sender;
-(IBAction)toSignUpView:(id)sender;

@end
