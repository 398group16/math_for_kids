//
//  HomeViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userObjects.h"

@interface HomeViewController : UIViewController{
    IBOutlet UIImageView* usrImage;
    IBOutlet UIButton* start;
    IBOutlet UIButton* tut;
    IBOutlet UIButton* score;
    IBOutlet UIButton* exit;
//    IBOutlet UIBarButtonItem* skip;
}
@property (strong, nonatomic) NSString* user_name;
@property (strong, nonatomic) NSString* user_img;
//-(IBAction)toTutorialView:(id)sender;

@end
