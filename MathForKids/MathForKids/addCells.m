//
//  addCells.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-21.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "addCells.h"

@implementation addCells

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //intialize our data to be stored in the json file
    }
    return self;
}

-(void)loadCellImg:(NSString *)newImg{
    UIImage* img = [UIImage imageNamed:newImg];
    [add_img setImage:img];
}

-(void)loadCellTitle:(NSString*)newTitle{
    [title setText:newTitle];
    
}


@end
