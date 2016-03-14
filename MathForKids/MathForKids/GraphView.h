//
//  GraphView.h
//  MathForKids
//
//  Created by Juanjuan Zhao on 16/3/10.
//  Copyright © 2016年 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#define kGraphHeight 310
#define kDefaultGraphWidth 352
#define kOffsetX 10
#define kStepX 38
#define kGraphBottom 315
#define kGraphTop 5

#define kStepY 50
#define kOffsetY 5


#define kCircleRadius 3  // circle redius
@interface GraphView : UIView
@property (nonatomic,strong) NSMutableArray* data;

@end