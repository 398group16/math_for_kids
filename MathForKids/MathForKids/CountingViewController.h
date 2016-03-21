//
//  CountingViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountingViewController : UIViewController{
    IBOutlet UIButton* Count;
    IBOutlet UIButton* add;
    IBOutlet UIButton* sub;
    IBOutlet UIButton* shape;
    IBOutlet UIButton* ytv;
    IBOutlet UITextView* field;
    IBOutlet UIButton* Home;
}

-(IBAction)toCountView:(id)sender;
-(IBAction)toAddView:(id)sender;
-(IBAction)toSubView:(id)sender;
-(IBAction)toShapeView:(id)sender;
-(IBAction)toHomeView:(id)sender;

@end
