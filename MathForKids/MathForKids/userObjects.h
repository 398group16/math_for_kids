//
//  userObjects.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-15.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userObjects : NSObject

@property (nonatomic, strong) NSNumber* usrId;
@property (nonatomic, strong) NSString* usrName;
@property (nonatomic, strong) NSString* favor;
@property (nonatomic, strong) NSString* img_name;


-(id)initWithName:(NSString*)usrName_
               Id:(NSNumber*)usrId_
            favor:(NSString*)favor_
         img_name:(NSString*)img_name_;

-(NSMutableDictionary*)toNSDictionary;

@end
