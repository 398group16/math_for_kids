//
//  GraphView.h
//  MathForKids
//
//  Created by Juanjuan Zhao on 16/3/10.
//  Copyright © 2016年 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#define kGraphHeight 300
#define kDefaultGraphWidth 600
#define kOffsetX 10
#define kStepX 50
#define kGraphBottom 300
#define kGraphTop 0

#define kStepY 70
#define kOffsetY 10

#define kBarTop 10
#define kBarWidth 40

#define kCircleRadius 3  // circle redius
@interface GraphView : UIView
@property (nonatomic,strong) NSMutableArray* data;

@end