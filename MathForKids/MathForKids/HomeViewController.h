//
//  HomeViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
=======
#import "userObjects.h"
>>>>>>> 581e9c799916e29fff14b14be8c1402b1d80e6bd

@interface HomeViewController : UIViewController{
    IBOutlet UIImageView* usrImage;
    IBOutlet UIButton* start;
    IBOutlet UIButton* tut;
    IBOutlet UIButton* score;
    IBOutlet UIButton* exit;
//    IBOutlet UIBarButtonItem* skip;
}
<<<<<<< HEAD
@property (strong, nonatomic) NSString* usrName;
=======
@property (strong, nonatomic) userObjects* user;
>>>>>>> 581e9c799916e29fff14b14be8c1402b1d80e6bd
//-(IBAction)toTutorialView:(id)sender;

@end
