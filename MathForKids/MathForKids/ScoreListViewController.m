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
    
    _segmentedCatagories.layer.masksToBounds = YES;
    
    [self checkScoreDictArray];
    [self checkCategory];
}

-(void)checkCategory{
    if ([self.navigationItem.title isEqualToString:@"Counting Scores"]) {
        [graph setData:countS];
        [graph setNeedsDisplay];// let scores graph view refresh themselves
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
    button.layer.masksToBounds = NO;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    //ofset defines how far shadow goes
    button.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUserName:(NSString *)newName{
    if (_userName != newName) {
        _userName = newName;
    }
    if (_userName == nil){
        _userName = [NSString stringWithFormat:@"Empty"];
    }
    //    NSLog(@"USER NAME: %@", _userName);
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
                if ([_userName isEqualToString:[s valueForKey:@"name"]]) {
                    temp = [s valueForKey:@"score"];
                    [countS addObject:temp];
                }
            }
        }else if ([[one valueForKey:@"category"] isEqualToString:@"Addition"]){
            tempScore = [one valueForKey:@"scoreList"];
            addS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                if ([_userName isEqualToString:[s valueForKey:@"name"]]) {
                    temp = [s valueForKey:@"score"];
                    [addS addObject:temp];
                }
            }
        }else if ([[one valueForKey:@"category"] isEqualToString:@"Subtraction"]){
            tempScore = [one valueForKey:@"scoreList"];
            subS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                if ([_userName isEqualToString:[s valueForKey:@"name"]]) {
                    temp = [s valueForKey:@"score"];
                    [subS addObject:temp];
                }
            }
        }else{
            tempScore = [one valueForKey:@"scoreList"];
            shapeS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                if ([_userName isEqualToString:[s valueForKey:@"name"]]) {
                    temp = [s valueForKey:@"score"];
                    [shapeS addObject:temp];
                }
            }
        }
    }
}

// allow the view to rotate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
