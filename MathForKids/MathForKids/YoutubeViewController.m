//
//  ViewController.m
//  youtubeEmbed
//
//  Created by raja on 2016-03-03.
//  Copyright © 2016 Vishal. All rights reserved.
//

#import "YoutubeViewController.h"

@interface YoutubeViewController ()


@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@property (weak, nonatomic) IBOutlet UIButton *playlistCountingButton;
@property (weak, nonatomic) IBOutlet UIButton *playlistAdditionButton;
@property (weak, nonatomic) IBOutlet UIButton *playlistSubtractionButton;
@property (weak, nonatomic) IBOutlet UIButton *playlistShapeButton;
@property (weak, nonatomic) IBOutlet UIButton *previousVidButton;//next button
@property (weak, nonatomic) IBOutlet UIButton *playVidButton;
@property (weak, nonatomic) IBOutlet UIButton *prevVidButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomShadow;


@end

@implementation YoutubeViewController

- (void)setAnswerButtonLayout:(UIButton*) button{
    
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 0.2f;
    
    //    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowRadius = 5;
    button.layer.shadowOffset = CGSizeMake(0.0f, 6.0f);
}//[self setAnswerButtonLayout:(count)];

- (void)setAnswerButtonLayout2:(UIButton*) button{
    
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 0.2f;
    
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowRadius = 5;
    button.layer.shadowOffset = CGSizeMake(0.0f, 6.0f);
}//[self setAnswerButtonLayout:(count)];

// sets video parameters
- (NSDictionary *)setVidPara {
    NSDictionary *playerVars = @{
                                 @"playsinline": @0,
                                 @"loop": @1,
                                 @"controls": @0,
                                 @"nologo": @1,
                                 @"autoplay": @1,
                                 @"controls": @0,
                                 @"disablekb": @1,
                                 @"enablejsapi": @1,
                                 @"modestbranding": @1,
                                 @"rel": @0,
                                 @"showinfo": @0,
                                 @"autohide": @1,
                                 @"color": @"white",
                                 @"iv_load_policy": @3,
                                 @"frameborder": @0,
                                 @"fs": @1,
                                 };
    
    return playerVars;
}//F9B243

-(void)setCheck:(UIButton*)butt {
    
    
    [[self playlistCountingButton] setImage:nil forState:UIControlStateNormal];
    [[self playlistAdditionButton] setImage:nil forState:UIControlStateNormal];
    [[self playlistShapeButton] setImage:nil forState:UIControlStateNormal];
    [[self playlistSubtractionButton] setImage:nil forState:UIControlStateNormal];
    
    int wid = butt.frame.size.width - [UIImage imageNamed: @"happy_face"].size.width;
    int hei = butt.frame.size.height - [UIImage imageNamed: @"happy_face"].size.height;
    
    butt.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
    [butt setImage:[UIImage imageNamed: @"happy_face"] forState:UIControlStateNormal];
}

- (void)selectPlayList:(int) IDnum{
    [[self playlistCountingButton] setEnabled:YES];
    [[self playlistAdditionButton] setEnabled:YES];
    [[self playlistSubtractionButton] setEnabled:YES];
    [[self playlistShapeButton] setEnabled:YES];
    
    if(IDnum==1){
        NSDictionary *vars = [self setVidPara];
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYW7hT5I7RgxXwTYepUB72GY" playerVars:vars];
        [[self playlistCountingButton] setEnabled:NO];
        [self setCheck:_playlistCountingButton];
    }
    else if(IDnum==2){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYVbwDpLm65Chhtd-G9CTP7J" playerVars:vars];
        [[self playlistAdditionButton] setEnabled:NO];
        [self setCheck:_playlistAdditionButton];
    }
    else if(IDnum==3){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYVT4eyM4GDk2nh2GdBGNo0p" playerVars:vars];
        [[self playlistSubtractionButton] setEnabled:NO];
        [self setCheck:_playlistSubtractionButton];
    }
    else if(IDnum==4){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYWisg1kIZDcnaPnen7Mj0np" playerVars:vars];
        [[self playlistShapeButton] setEnabled:NO];
        [self setCheck:_playlistShapeButton];
    }
}

//loads the video for the view
- (void) loadVideo {
    [self selectPlayList:1];
}

//plays counting playlist
- (IBAction)playlistCountingButton:(id)sender {
    [self selectPlayList:1];
}

- (IBAction)playlistAdditionButton:(id)sender {
    [self selectPlayList:2];
}

- (IBAction)playlistSubtractionButton:(id)sender {
    [self selectPlayList:3];
}

- (IBAction)playlistShapeButton:(id)sender {
    [self selectPlayList:4];
}

//plays video

- (IBAction)playVideo:(id)sender {
        [self.playerView playVideo];
}

//plays next video in playlist
- (IBAction)nextVideo:(id)sender {
    [self.playerView nextVideo];
    [self.playerView stopVideo];
}

//plays video
- (IBAction)previousVideo:(id)sender {
    [self.playerView previousVideo];
    [self.playerView stopVideo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //playsinline plays vid in app rather than playing full screen
    
    self.navigationItem.title = @"Tutorial";
    
    [[self.playerView layer] setBorderWidth:1.0f];
    [[self.playerView layer] setBorderColor:[UIColor blackColor].CGColor];
    self.playerView.clipsToBounds = YES;
    
    //setting button layouts
    [self setAnswerButtonLayout:(_playlistCountingButton)];
    [self setAnswerButtonLayout:(_playlistAdditionButton)];
    [self setAnswerButtonLayout:(_playlistSubtractionButton)];
    [self setAnswerButtonLayout2:(_bottomShadow)];
    
    // load the video
    [self loadVideo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
