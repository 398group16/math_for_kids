//
//  YoutubeViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-26.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YoutubeViewController : UIViewController{
    IBOutlet UIWebView* myWebView;
}
@property (strong, nonatomic) NSString* detailItem;

@end
