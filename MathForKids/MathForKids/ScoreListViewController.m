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
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCatagories;

@end

@implementation ScoreListViewController

- (IBAction)segmentedCatagoriesAction:(id)sender {
    
    // for counting
    if(_segmentedCatagories.selectedSegmentIndex == 0){
        self.navigationItem.title = @"Counting Scores";
        [self checkCategory];
        
    }//for addition
    else if(_segmentedCatagories.selectedSegmentIndex == 1){
        self.navigationItem.title = @"Addition Scores";
        [self checkCategory];
        
    }//for subtraction
    else if (_segmentedCatagories.selectedSegmentIndex == 2){
        self.navigationItem.title = @"Subtraction Scores";
        [self checkCategory];
        
    }//for shapes
    else if (_segmentedCatagories.selectedSegmentIndex == 3){
        self.navigationItem.title = @"Shape Scores";
        [self checkCategory];
        
    }//DEFAULT for counting
    else {
        self.navigationItem.title = @"Counting Scores";
        [self checkCategory];
        
        //        count.layer.masksToBounds = YES;
        //        [self setShadows:(sub)];
        //        [self setShadows:(add)];
        //        [self setShadows:(shape)];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setting up colors for segmented list
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor whiteColor],
                                NSForegroundColorAttributeName,
                                nil];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor whiteColor],
                                           NSForegroundColorAttributeName,
                                           nil];
    [_segmentedCatagories setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [_segmentedCatagories setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];
    _segmentedCatagories.layer.cornerRadius = 0.0;
    _segmentedCatagories.layer.borderWidth = 1.0f;
    
//    _segmentedCatagories.layer.backgroundColor = [UIColor greenColor].CGColor;
    _segmentedCatagories.layer.masksToBounds = YES;
    
    
    // Do any additional setup after loading the view.
    [self setShadows:shape];
    [self setShadows:add];
    [self setShadows:sub];
    [self setShadows:count];
//    [self setShadows:_shareButton];
    
    
    // gives it paper look shadow, curved under
//    CALayer *shareButton = _shareButton.layer;
    _shareButton.layer.masksToBounds = NO;
    _shareButton.layer.shadowOffset = CGSizeZero;
    _shareButton.layer.shadowColor = [[UIColor blackColor] CGColor];
    _shareButton.layer.shadowRadius = 2.0f;
    _shareButton.layer.shadowOpacity = 0.80f;
    _shareButton.layer.shadowPath = [self awesomeShadow:_shareButton.layer.bounds];
    
    
    
    [self checkScoreDictArray];
//    graph = [[GraphView alloc] init];
    [self checkCategory];
    _scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    
}

-(void)checkCategory{
    if ([self.navigationItem.title isEqualToString:@"Counting Scores"]) {
        [graph setData:countS];
        [graph setNeedsDisplay];
        _segmentedCatagories.selectedSegmentIndex = 0;
    }else if ([self.navigationItem.title isEqualToString:@"Addition Scores"]) {
        [graph setData:addS];
        [graph setNeedsDisplay];
        _segmentedCatagories.selectedSegmentIndex = 1;
    }else if ([self.navigationItem.title isEqualToString:@"Subtraction Scores"]) {
        [graph setData:subS];
        [graph setNeedsDisplay];
        _segmentedCatagories.selectedSegmentIndex = 2;
    }else if ([self.navigationItem.title isEqualToString:@"Shape Scores"]) {
        [graph setData:shapeS];
        [graph setNeedsDisplay];
        _segmentedCatagories.selectedSegmentIndex = 3;
    }else{
        [graph setData:countS];
        [graph setNeedsDisplay];
        _segmentedCatagories.selectedSegmentIndex = 0;
    }
    
}
- (void) setShadows: (UIButton*) button{
    //
    ////    button.layer.cornerRadius = 4.0f;
    ////    button.layer.shadowRadius = 3;
    button.layer.masksToBounds = NO;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    //ofset defines how far shadow goes
    button.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

-(IBAction)countAction:(id)sender{
    self.navigationItem.title = @"Counting Scores";
    [self checkCategory];
    
    count.layer.masksToBounds = YES;
    [self setShadows:(sub)];
    [self setShadows:(add)];
    [self setShadows:(shape)];
}
-(IBAction)addAction:(id)sender{
    self.navigationItem.title = @"Addition Scores";
    [self checkCategory];
    
    add.layer.masksToBounds = YES;
    [self setShadows:(sub)];
    [self setShadows:(count)];
    [self setShadows:(shape)];
}
-(IBAction)subAction:(id)sender{
    self.navigationItem.title = @"Subtraction Scores";
    [self checkCategory];
    
    sub.layer.masksToBounds = YES;
    [self setShadows:(count)];
    [self setShadows:(add)];
    [self setShadows:(shape)];

}
-(IBAction)shapeAction:(id)sender{
    self.navigationItem.title = @"Shape Scores";
    [self checkCategory];
    
    shape.layer.masksToBounds = YES;
    [self setShadows:(sub)];
    [self setShadows:(add)];
    [self setShadows:(count)];
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
    
    [[self shareButton] setHidden:YES];
    
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
    
    [[self shareButton] setHidden:NO];
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

- (CGPathRef)awesomeShadow:(CGRect)rect
{
    CGSize size = rect.size;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + 15.0f)];
    
    [path addCurveToPoint:CGPointMake(0.0, size.height + 15.0f)
            controlPoint1:CGPointMake(size.width - 15.0f, size.height)
            controlPoint2:CGPointMake(15.0f, size.height)];
    
    return path.CGPath;
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
