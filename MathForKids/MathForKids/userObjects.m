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
@synthesize img_name;

-(id)initWithName:(NSString*)usrName_
               Id:(NSNumber*)usrId_
            favor:(NSString*)favor_
         img_name:(NSString*)img_name_{
    self = [super init];
    if (self) {
        self.usrName = usrName_;
        self.usrId = usrId_;
        self.favor = favor_;
        self.img_name = img_name_;
        
    }
    return self;
}

-(NSMutableDictionary*)toNSDictionary{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    [dict setValue:self.usrName forKey:@"name"];
    [dict setValue:self.usrId forKey:@"id"];
    [dict setValue:self.favor forKey:@"favor"];
    [dict setValue:self.img_name forKey:@"img"];
    
    return dict;
}



@end
