//
//  SettingViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *upperAboutShadow;

@end

@implementation SettingViewController


- (void)setAnswerButtonLayout:(UIButton*) button{
    
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 0.2f;
    
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowRadius = 5;
    button.layer.shadowOffset = CGSizeMake(0.0f, 6.0f);
}//[self setAnswerButtonLayout:(count)];

- (void)addIcon:(UIButton*) button1{
            int wid = button1.frame.size.width - [UIImage imageNamed: @"chevron-right"].size.width;
            int hei = button1.frame.size.height - [UIImage imageNamed: @"chevron-right"].size.height;
    
            button1.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Settings";
    
    [self setAnswerButtonLayout:(change)];
    [self setAnswerButtonLayout:(add)];
    [self setAnswerButtonLayout:(del)];
    [self setAnswerButtonLayout:(changeImage)];
    [self setAnswerButtonLayout:(_upperAboutShadow)];
    
    [self addIcon:(change)];
    [self addIcon:(add)];
    [self addIcon:(del)];
    [self addIcon:(changeImage)];
    [self addIcon:(about)];
    
    [userImage setImage:_img_name];
    [userlabel setText:_user_name];
}

-(void)setUser_name:(NSString *)new_name{
    if(_user_name != new_name){
        _user_name = new_name;
    }
}

-(void)setImg_name:(UIImage*)new_name{
    if(_img_name != new_name){
        _img_name = new_name;
    }
}

/*write json string to local score json library*/
-(NSString*)writeToScore:(NSString*)string{
    
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

/*get local score json library*/
- (NSString*)readStringFromScore{
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"localScore.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    //    NSLog(@"%@", filePath);
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

/*if user delete their user account all the scores in that user also should be deleted*/
-(NSString*)deleteJsonScore:(NSString*)old_json{
    NSError* error;
    NSDictionary *old_dict = [NSJSONSerialization JSONObjectWithData:[old_json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    for(NSDictionary* one in old_dict){
        NSDictionary* tempScore = [one valueForKey:@"scoreList"];
        NSMutableArray *arrayS = [NSMutableArray arrayWithCapacity:[tempScore count]];
        
        for(NSDictionary* ts in tempScore){
            NSString* tmpName = [ts valueForKey:@"name"];
            if (![tmpName isEqualToString:_user_name]) {
                [arrayS addObject:ts];
            }
        }
        
        NSMutableDictionary* tempDict = [[NSMutableDictionary alloc] init];
        [tempDict setValue:[one valueForKey:@"category"] forKey:@"category"];
        [tempDict setValue:arrayS forKey:@"scoreList"];
        [array addObject:tempDict];
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
    return str;
}

/* write new json string about user accouts into local user accout library*/
-(NSString*)writeToFile:(NSString*)string{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"users.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    NSLog(@"%@", filePath);
    
    [[string dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    return filePath;
}



//get all the user accounts from local json library
- (NSString*)readStringFromFile{
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"users.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

/*delete user account in local user account json library*/
-(NSString*)deleteJson:(NSString*)old_json{
    NSError* error;
    NSDictionary *old_dict = [NSJSONSerialization JSONObjectWithData:[old_json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for(NSDictionary* one in old_dict){
        if (![[one valueForKey:@"name"] isEqualToString:_user_name]) {
            [array addObject:one];
        }
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
    return str;
}


-(IBAction)addSelect:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*if user press delete user button then we will show an alert warning to let user make sure they wanna delete this one*/
-(IBAction)delSelect:(id)sender{
    UIAlertController * alert= [UIAlertController
                                alertControllerWithTitle:@"Warning"
                                message:@"Are you sure you want to delete this user account?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             NSString* str = [self readStringFromFile];
                             [self writeToFile:[self deleteJson:str]];
                             NSString* score = [self readStringFromScore];
                             [self writeToScore:[self deleteJsonScore:score]];
                             [self.navigationController popToRootViewControllerAnimated:YES];
                             [alert dismissViewControllerAnimated:YES completion:nil];   
                         }];
    UIAlertAction* cancel = [UIAlertAction
                         actionWithTitle:@"Cancel"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"changeImage"]) {
        [[segue destinationViewController] setUser_name:_user_name];
    }else if ([[segue identifier] isEqualToString:@"changeName"]) {
        [[segue destinationViewController] setUser_name:_user_name];
    }
}
@end
