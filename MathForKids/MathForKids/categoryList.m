//
//  categoryList.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-29.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "categoryList.h"


@implementation categoryList

@synthesize category;
@synthesize scoreList;

- (NSMutableDictionary*)toNSDictionary
{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSMutableArray *myScoreList = [[NSMutableArray alloc] init];
    
    for (scoreObjects* score in self.scoreList) {
        [myScoreList addObject:[score toNSDictionary]];
    }
    
    [dict setValue:self.category forKey:@"category"];
    [dict setValue:myScoreList forKey:@"scoreList"];
    
    return dict;
}

@end
