//
//  scoreObjects.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-28.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "scoreObjects.h"

@implementation scoreObjects


@synthesize name;
@synthesize score;

-(id)initWithName:(NSString *)name_
            score:(NSNumber *)score_{
    self = [super init];
    if (self) {
        if(name_ == nil){
            self.name = @"Empty";
            self.score = score_;
        }else{
            self.score = score_;
            self.name = name_;
        }
    }
    return self;
}

-(NSMutableDictionary*)toNSDictionary{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.name forKey:@"name"];
    [dict setValue:self.score forKey:@"score"];
    
    return dict;
}


@end
