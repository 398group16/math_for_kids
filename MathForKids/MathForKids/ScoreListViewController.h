//
//  ScoreListViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-09.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;

@property (nonatomic, strong) NSDictionary* scoreDict;
-(void)setScoreDict:(NSDictionary*) newDict;

@end
