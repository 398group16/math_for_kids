//
//  YoutubeViewController.h
//  MathForKids
//
//  Created by raja on 2016-03-03.
//  Copyright © 2016 Vishal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface YoutubeViewController : UIViewController

//button plays the inline video on view
- (IBAction)playVideo:(id)sender;

//button plays the next video in the inline view
- (IBAction)nextVideo:(id)sender;

//button plays the next video in the inline view
- (IBAction)previousVideo:(id)sender;
//@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;


@end

