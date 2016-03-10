//
//  ScoreViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-28.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "ScoreViewController.h"
#import "scoreObjects.h"
#import "categoryList.h"

@interface ScoreViewController ()

@property (nonatomic, strong) categoryList* cateList;
@property (nonatomic, strong) NSString* filePath;

@end

@implementation ScoreViewController

- (void)setAnswerButtonLayout:(UIButton*) button{
    
//    [self setAnswerButtonLayout:(compare)];
    button.layer.cornerRadius = 8.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
}

- (void)setLabelLayout:(UILabel*) label{
    
    [[label layer] setBorderWidth:1.0f];
    [[label layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[label layer] setCornerRadius:10.0f];
    [label setFont:[UIFont boldSystemFontOfSize:27]];
    label.text = [NSString stringWithFormat:@"%@", self.score];
    [label setFont:[UIFont boldSystemFontOfSize:21]];
    label.clipsToBounds=YES;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //intialize our data to be stored in the json file
        [self loadScoreData];
    }
    return self;
}

-(void)loadScoreData{
    
    self.cateList = [[categoryList alloc] init];
    
    NSMutableArray* scoreList = [[NSMutableArray alloc] init];
    
    //convert NSString to NSNumber
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* num = [f numberFromString:_score];
    
    scoreObjects* score = [[scoreObjects alloc] initWithName:_usrName score:num];
//    NSLog(@"33   %@, %@", score.name, score.score);
    [scoreList addObject:score];
    
    categoryList* cate = [[categoryList alloc] init];
    cate.category = self.navigationItem.title;
//    NSLog(@"22   %@", cate.category);
    cate.scoreList = scoreList;
    self.cateList = cate;
}
- (IBAction)homeButtonClick:(id)sender {

    NSArray *viewControllers = [[self navigationController] viewControllers];
    
    id obj=[viewControllers objectAtIndex:1];
    [[self navigationController] popToViewController:obj animated:YES];
    //    NSLog(@"%@",viewControllers);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setAnswerButtonLayout:(home)];
    [self setAnswerButtonLayout:(share)];
    [self setAnswerButtonLayout:(compare)];
    [self setLabelLayout:(label2)];
    
    [self.navigationItem setHidesBackButton:YES];
    
    /*write json file*/
    [self loadScoreData];
    
    NSMutableDictionary* dict = [self.cateList toNSDictionary];
    
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization
                        dataWithJSONObject:dict
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    
    if ([jsonData length] > 0 && error == nil) {
        NSString *str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

        /*save file to */
        
        NSString* temp = [self readStringFromFile];
        if (nil == temp) {
            [self writeToFile:str];
        }else{
//            NSLog(@"%@", temp);
            NSString* combine = [self appendJsonFile:temp newJson:str];
            NSLog(@"Combine: %@", combine);
            [self writeToFile:combine];
        }
        
        
//        NSString *read = [self readStringFromFile];
//        NSLog(@"%@", read);
        
    }else if ([jsonData length] == 0 &&
              error == nil){
        NSLog(@"No data was returned after serialization.");
    }else if (error != nil){
        NSLog(@"An error happened = %@", error);
    }
    
//    self.navigationItem.title = @"Menu";
//    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithTitle:@"< Home" style:UIBarButtonItemStylePlain target:self action:@selector(handleBack:)];
//    
//    
//    self.navigationItem.leftBarButtonItem = backButton;
}

//-(void)handleBack:(id)sender{
//    UIViewController* vc =[[self.navigationController viewControllers]objectAtIndex:1];
//    [self.navigationController popToViewController:vc animated:YES];
//    
//}

-(NSString*)appendJsonFile:(NSString*)oldJson
                   newJson:(NSString*)newJson{
//    NSData* data = [oldJson dataUsingEncoding:NSUTF8StringEncoding];
//    NSMutableArray* arr = [NSJSONSerialization JSONObjectWithData:data options:nil error:&error];
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[oldJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[dict count]];
    
    error = nil;
    NSDictionary *newDict = [NSJSONSerialization JSONObjectWithData:[newJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
     /*combine old and new*/
    bool found = false;
    for (NSDictionary* one in dict){
        NSString* tempCate = [one valueForKey:@"category"];
        NSString* newCate = [newDict valueForKey:@"category"];
        
        if ([tempCate isEqualToString:newCate]) {
            found = true;
            NSDictionary* tempScore = [one valueForKey:@"scoreList"];
            NSMutableArray *arrayS = [NSMutableArray arrayWithCapacity:[tempScore count]];
            
            for(NSDictionary* s in tempScore){
                [arrayS addObject:s];
            }
            
            NSDictionary* tempS = [newDict valueForKey:@"scoreList"];
            for(NSDictionary* s in tempS){
                [arrayS addObject:s];
            }
//            NSLog(@"22222");
            NSMutableDictionary* tempDict = [[NSMutableDictionary alloc] init];
            [tempDict setValue:tempCate forKey:@"category"];
            [tempDict setValue:arrayS forKey:@"scoreList"];
//            NSLog(@"11111");
            [array addObject:tempDict];
        }else{
            [array addObject:one];
        }
        
        
    }
    /*if new json have a new value of category, then add new json*/
    if (!found) {
        [array addObject:newDict];
    }
    
    error = nil;
    NSData* jsonData = [NSJSONSerialization
                        dataWithJSONObject:array
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    NSString *str;
    if ([jsonData length] > 0 && error == nil) {
        str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
//    NSLog(@"Combine JSON: %@", str);
    return str;
}

-(NSString*)writeToFile:(NSString*)string{
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"localScore.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    NSLog(@"%@", filePath);
    
    [[string dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    return filePath;
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

-(void)setUsrName:(NSString*)newName{
//    NSLog(@"%@", newName);
    if(_usrName != newName){
        _usrName = newName;
    }
}

- (void)setScore:(NSString*)newScore{
//    NSLog(@"%@", newScore);
    if (_score != newScore) {
        _score = newScore;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
