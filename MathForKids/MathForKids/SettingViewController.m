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
    
    //    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowRadius = 5;
    button.layer.shadowOffset = CGSizeMake(0.0f, 6.0f);
}//[self setAnswerButtonLayout:(count)];

- (void)addIcon:(UIButton*) button1{
    
    
//    [button1 setImage:[UIImage imageNamed: @"chevron-right"] forState:UIControlStateNormal];
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
    [self setAnswerButtonLayout2:(_upperAboutShadow)];
    
    
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

//get json
- (NSString*)readStringFromScore{
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"localScore.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    //    NSLog(@"%@", filePath);
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

-(NSString*)deleteJsonScore:(NSString*)old_json{
    NSError* error;
    NSDictionary *old_dict = [NSJSONSerialization JSONObjectWithData:[old_json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    for(NSDictionary* one in old_dict){
        NSDictionary* tempScore = [one valueForKey:@"scoreList"];
        NSMutableArray *arrayS = [NSMutableArray arrayWithCapacity:[tempScore count]];
        
        for(NSDictionary* ts in tempScore){
            NSString* tmpName = [ts valueForKey:@"name"];
            //                NSLog(@"temp name:%@, name:%@", tempStr, tmpName);
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
    //    NSLog(@"combine users: %@", str);
    return str;
}


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



//get json
- (NSString*)readStringFromFile{
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"users.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    //    NSLog(@"%@", filePath);
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

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
    //    NSLog(@"combine users: %@", str);
    return str;
}


-(IBAction)addSelect:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)delSelect:(id)sender{
    UIAlertController * alert= [UIAlertController
                                alertControllerWithTitle:@"Warning"
                                message:@"Are you sure you wanna delete this user account!"
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    if ([[segue identifier] isEqualToString:@"changeUserInfo"]) {
//        [[segue destinationViewController] setUser_name:_user_name];
//    }
//}


@end
