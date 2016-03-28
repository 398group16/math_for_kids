//
//  GameCategoryViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-27.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameCategoryViewController : UIViewController{
    IBOutlet UIImageView* myImage;
<<<<<<< HEAD
=======
    IBOutlet UILabel* usrLabel;
>>>>>>> cdbd5e68f5f623f3f41a0e84d4938da320f6ec5b
    IBOutlet UIButton* count;
    IBOutlet UIButton* add;
    IBOutlet UIButton* sub;
    IBOutlet UIButton* shape;
}
@property (strong, nonatomic) NSString* usrName;
@property (strong, nonatomic) UIImage* userImg;

@end