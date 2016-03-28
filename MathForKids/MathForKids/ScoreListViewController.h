//
//  ScoreListViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-09.
//  Copyright © 2016 398group16. All rights reserved.
//
#import "GraphView.h"
#import <UIKit/UIKit.h>

@interface ScoreListViewController : UIViewController{
    IBOutlet GraphView* graph;
<<<<<<< HEAD

    IBOutlet UIButton* count;
    IBOutlet UIButton* add;
    IBOutlet UIButton* sub;
    IBOutlet UIButton* shape;
=======
>>>>>>> cdbd5e68f5f623f3f41a0e84d4938da320f6ec5b
}

@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (nonatomic, strong) NSString* userName;
-(void)setUserName:(NSString *)newName;
<<<<<<< HEAD
-(IBAction)countAction:(id)sender;
-(IBAction)addAction:(id)sender;
-(IBAction)subAction:(id)sender;
-(IBAction)shapeAction:(id)sender;
=======
>>>>>>> cdbd5e68f5f623f3f41a0e84d4938da320f6ec5b

@end
