//
//  GraphView.h
//  MathForKids
//
//  Created by Juanjuan Zhao on 16/3/10.
//  Copyright © 2016年 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#define kGraphHeight self.frame.size.height - 7
#define kDefaultGraphWidth self.frame.size.width-27
#define kOffsetX 10
#define kStepX (kDefaultGraphWidth-10)/ 9
#define kGraphBottom self.frame.size.height
#define kGraphTop 10

#define kStepY kGraphHeight/6
#define kOffsetY 7


#define kCircleRadius 3  // circle redius
@interface GraphView : UIView
@property (nonatomic,strong) NSMutableArray* data;

@end