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
@property (nonatomic, strong) NSString* userName;
-(void)setUserName:(NSString *)newName;
-(IBAction)countAction:(id)sender;
-(IBAction)addAction:(id)sender;
-(IBAction)subAction:(id)sender;
-(IBAction)shapeAction:(id)sender;

@end
