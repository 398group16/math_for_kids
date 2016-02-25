//
//  ViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-24.
//  Copyright (c) 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView* usrImage1;
    IBOutlet UIImageView* usrImage2;
    IBOutlet UIImageView* usrImage3;
    IBOutlet UINavigationBar* mainBar;
    IBOutlet UIButton* liButton;
    IBOutlet UIBarButtonItem* skip;
}

-(IBAction)toSignUp:(id)sender;
-(IBAction)skipView:(id)sender;


@end


