//
//  ScoreListViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-09.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "ScoreListViewController.h"
#import "QuartzCore/QuartzCore.h"


@interface ScoreListViewController (){
    NSMutableArray *countS;
    NSMutableArray *addS;
    NSMutableArray *subS;
    NSMutableArray *shapeS;
    
}

@end

@implementation ScoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self checkScoreDictArray];
//    graph = [[GraphView alloc] init];
    [self checkCategory];
    _scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    
}

-(void)checkCategory{
    if ([self.navigationItem.title isEqualToString:@"Counting"]) {
        [graph setData:countS];
        [graph setNeedsDisplay];
    }else if ([self.navigationItem.title isEqualToString:@"Addition"]) {
        [graph setData:addS];
        [graph setNeedsDisplay];
    }else if ([self.navigationItem.title isEqualToString:@"Subtraction"]) {
        [graph setData:subS];
        [graph setNeedsDisplay];
    }else if ([self.navigationItem.title isEqualToString:@"Shape"]) {
        [graph setData:shapeS];
        [graph setNeedsDisplay];
    }else{
        [graph setData:countS];
        [graph setNeedsDisplay];
    }
    
}

-(IBAction)countAction:(id)sender{
    self.navigationItem.title = @"Counting";
    [self checkCategory];
}
-(IBAction)addAction:(id)sender{
    self.navigationItem.title = @"Addition";
    [self checkCategory];
}
-(IBAction)subAction:(id)sender{
    self.navigationItem.title = @"Subtraction";
    [self checkCategory];
}
-(IBAction)shapeAction:(id)sender{
    self.navigationItem.title = @"Shape";
    [self checkCategory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setScoreDict:(NSDictionary*) newDict{
    if (_scoreDict != newDict) {
        _scoreDict = newDict;
    }
}

//takes a screenshot
- (IBAction)shareButton:(id)sender {
    
    //takes screenshot and saves in cameraroll
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    UIImageWriteToSavedPhotosAlbum(screenShotImage, nil, nil, nil); //this line saces the screenshot on camera roll which we dont want
    
    
    
    
    
    NSString *shareText = @"Check out my scores on the Math for Kids app and go download your game from the App Store now!!!!";
    
    NSArray *itemsToShare = @[shareText, screenShotImage];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    
    activityVC.excludedActivityTypes = @[UIActivityTypePostToTencentWeibo,UIActivityTypePostToFlickr, UIActivityTypeCopyToPasteboard, UIActivityTypePostToVimeo, UIActivityTypeAddToReadingList, UIActivityTypeAirDrop, UIActivityTypeAssignToContact, UIActivityTypePrint];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

//get json
- (NSString*)readStringFromFile{
    
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"localScore.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

-(void) checkScoreDictArray{
    NSDictionary* tempScore;
    NSNumber* temp;
    
    NSString* jsonScore = [self readStringFromFile];
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[jsonScore dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    for (NSDictionary* one in dict){
        if ([[one valueForKey:@"category"] isEqualToString:@"Counting"]){
            tempScore = [one valueForKey:@"scoreList"];
            countS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                temp = [s valueForKey:@"score"];
//                float sc = [temp floatValue];
                [countS addObject:temp];
            }
        }else if ([[one valueForKey:@"category"] isEqualToString:@"Addition"]){
            tempScore = [one valueForKey:@"scoreList"];
            addS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                temp = [s valueForKey:@"score"];
                [addS addObject:temp];
            }
        }else if ([[one valueForKey:@"category"] isEqualToString:@"Subtraction"]){
            tempScore = [one valueForKey:@"scoreList"];
            subS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                temp = [s valueForKey:@"score"];
                [subS addObject:temp];
            }
        }else{
            tempScore = [one valueForKey:@"scoreList"];
            shapeS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                temp = [s valueForKey:@"score"];
                [shapeS addObject:temp];
            }
        }
    }
    NSLog(@"Counting scores count:%lu, Addition scores count:%lu, Subtraction scores count:%lu, Shape scores count:%lu", countS.count, addS.count, subS.count, shapeS.count);
//    NSLog(@"%f", [[countS objectAtIndex:3]floatValue]);
}

// allow the view to rotate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
