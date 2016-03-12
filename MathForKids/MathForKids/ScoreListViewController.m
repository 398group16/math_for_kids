//
//  ScoreListViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-09.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "ScoreListViewController.h"

@interface ScoreListViewController ()

@end

@implementation ScoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self checkScoreDictArray];
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

-(void) checkScoreDictArray{
    NSMutableArray *countS;
    NSMutableArray *addS;
    NSMutableArray *subS;
    NSMutableArray *shapeS;
    NSDictionary* tempScore;
    
    for (NSDictionary* one in _scoreDict){
        if ([[one valueForKey:@"category"] isEqualToString:@"Counting"]){
            tempScore = [one valueForKey:@"scoreList"];
            countS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                [countS addObject:s];
            }
        }else if ([[one valueForKey:@"category"] isEqualToString:@"Addition"]){
            tempScore = [one valueForKey:@"scoreList"];
            addS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                [addS addObject:s];
            }
        }else if ([[one valueForKey:@"category"] isEqualToString:@"Subtraction"]){
            tempScore = [one valueForKey:@"scoreList"];
            subS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                [subS addObject:s];
            }
        }else{
            tempScore = [one valueForKey:@"scoreList"];
            shapeS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            for (NSDictionary* s in tempScore){
                [shapeS addObject:s];
            }
        }
    }
    NSLog(@"Counting scores count:%lu, Addition scores count:%lu, Subtraction scores count:%lu, Shape scores count:%lu", (unsigned long)countS.count, addS.count, subS.count, shapeS.count);
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
