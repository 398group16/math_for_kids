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
}

@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (nonatomic, strong) NSString* userName;
-(void)setUserName:(NSString *)newName;

@end
