//
//  scoreObjects.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-28.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface scoreObjects : NSObject

@property (nonatomic, strong) NSNumber* score;
@property (nonatomic, strong) NSString* name;


-(id)initWithName:(NSString*)name_
            score:(NSNumber*)score_;

-(NSMutableDictionary*)toNSDictionary;

@end
