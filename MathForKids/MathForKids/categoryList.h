//
//  categoryList.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-29.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "scoreObjects.h"

@interface categoryList : NSObject

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSMutableArray *scoreList;

- (NSMutableDictionary *)toNSDictionary;


@end
