//
//  GraphView.m
//  MathForKids
//
//  Created by Juanjuan Zhao on 16/3/10.
//  Copyright © 2016年 398group16. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

float data[] = {0.7, 0.4, 0.9, 1.0, 0.2, 0.85, 0.11, 0.75, 0.53, 0.44, 0.88, 0.77, 0.99, 0.55};

- (void)drawBar:(CGRect)rect context:(CGContextRef)ctx
{
    CGContextBeginPath(ctx);
    
    // preparing the enviorment for drawing
    CGContextSetGrayFillColor(ctx, 0.2, 0.7);
    
    CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
    CGContextClosePath(ctx);
    //commit the draw
    CGContextFillPath(ctx);
}

- (void)drawLineGraphWithContext:(CGContextRef)ctx
{
    //The first step is to set up the environment, in this case to define
    //the width and the color of the line we are going to use
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    
    
    int maxGraphHeight = kGraphHeight - kOffsetY;
    
    // define the color for filling the graph
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:0.5] CGColor]);
    // fill the graph with color
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight);
    CGContextAddLineToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * data[0]);
    for (int i = 1; i < sizeof(data); i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * data[i]);
    }
    CGContextAddLineToPoint(ctx, kOffsetX + (sizeof(data) - 1) * kStepX, kGraphHeight);
    CGContextClosePath(ctx);
    
    CGContextDrawPath(ctx, kCGPathFill);
    //-----------------------------------
    
    //start drawing line (path)
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * data[0]);
    
    for (int i = 1; i < sizeof(data); i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * data[i]);
    }
    
    CGContextDrawPath(ctx, kCGPathStroke);
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    //-----------------------------------
    
    // add point to the graph
    for (int i = 1; i < sizeof(data) - 1; i++)
    {
        float x = kOffsetX + i * kStepX;
        float y = kGraphHeight - maxGraphHeight * data[i];
        CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
        CGContextAddEllipseInRect(ctx, rect);
    }
    CGContextDrawPath(ctx, kCGPathFillStroke);
    //-----------------------------------
    
    
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw the background image
    
    //    UIImage *image = [UIImage imageNamed:@"background.png"];
    //    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    //    CGContextDrawImage(context, imageRect, image.CGImage);
    //    CGContextSetLineWidth(context, 0.6);
    //    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    
    //make the line dashed.  The dash array specifies that there are two elements
    // in the pattern: a dash and an empty space after it. The last parameter of
    //the CGContextSetLineDash function, 2, is the number of elements in the dash array
    
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(context, 0.0, dash, 2);
    
    
    // How many lines?
    int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
    
    // Here the vertical lines go
    for (int i = 0; i < howMany; i++)
    {
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    // Here the horizantal lines go
    int howManyHorizontal = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom - kOffsetY - i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - kOffsetY - i * kStepY);
    }
    
    
    CGContextStrokePath(context);
    
    // for the last line, undashed.
    CGContextSetLineDash(context, 0, NULL, 0); // Remove the dash
    
    
    // Draw the bars
    //    float maxBarHeight = kGraphHeight - kBarTop - kOffsetY;
    //
    //    for (int i = 0; i < sizeof(data); i++)
    //    {
    //        float barX = kOffsetX + kStepX + i * kStepX - kBarWidth / 2;
    //        float barY = kBarTop + maxBarHeight - maxBarHeight * data[i];
    //        float barHeight = maxBarHeight * data[i];
    //
    //        CGRect barRect = CGRectMake(barX, barY, kBarWidth, barHeight);
    //        [self drawBar:barRect context:context];
    //    }
    //    CGRect barRect = CGRectMake(barX, barY, kBarWidth, barHeight);
    [self drawLineGraphWithContext:context];
    
    //create x axis labels
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor]);
    for (int i = 1; i < sizeof(data); i++)
    {
        NSString *theText = [NSString stringWithFormat:@"%d", i];
        CGSize labelSize = [theText sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18]];
        CGContextShowTextAtPoint(context,  i * kStepX - 45, kGraphBottom - 5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
    }
}
@end
