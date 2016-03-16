//
//  userObjects.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-15.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "userObjects.h"

@implementation userObjects

@synthesize usrName;
@synthesize usrId;
@synthesize favor;

-(id)initWithName:(NSString*)usrName_
            score:(NSNumber*)usrId_
            favor:(NSString*)favor_{
    self = [super init];
    if (self) {
        
        self.usrName = @"Empty";
        self.usrId = usrId_;
        self.favor = favor_;
//            NSLog(@"%@, %@", self.name, self.score);
        
        
        //        self.score = score_;
        //        self.name = name_;
        //        NSLog(@"%@, %@", self.name, self.score);
        
    }
    return self;
}

-(NSMutableDictionary*)toNSDictionary{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.usrName forKey:@"name"];
    [dict setValue:self.usrId forKey:@"id"];
    [dict setValue:self.favor forKey:@"favor"];
    
    return dict;
}



@end
