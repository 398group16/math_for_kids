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

    IBOutlet UIButton* count;
    IBOutlet UIButton* add;
    IBOutlet UIButton* sub;
    IBOutlet UIButton* shape;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
<<<<<<< HEAD
@property (nonatomic, strong) NSDictionary* scoreDict;
-(void)setScoreDict:(NSDictionary*) newDict;
=======
@property (nonatomic, strong) NSString* userName;
-(void)setUserName:(NSString *)newName;
>>>>>>> 581e9c799916e29fff14b14be8c1402b1d80e6bd
-(IBAction)countAction:(id)sender;
-(IBAction)addAction:(id)sender;
-(IBAction)subAction:(id)sender;
-(IBAction)shapeAction:(id)sender;

@end
