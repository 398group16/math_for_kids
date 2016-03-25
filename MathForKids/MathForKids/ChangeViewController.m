//
//  ChangeViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController (){
    NSString* img_name;
}

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Change Image";
    
    [self setAnswerButtonLayout:(button1)];
    [self setAnswerButtonLayout:(button2)];
    [self setAnswerButtonLayout:(button3)];
    [self setAnswerButtonLayout:(button4)];
    [self setAnswerButtonLayout:(button5)];
    [self setAnswerButtonLayout:(button6)];
    
    [self setButton:button1];
    [button1 setBackgroundImage:[UIImage imageNamed:@"usrImage1"] forState:UIControlStateNormal];
    [self setButton:button2];
    [button2 setBackgroundImage:[UIImage imageNamed:@"usrImage2"] forState:UIControlStateNormal];
    [self setButton:button3];
    [button3 setBackgroundImage:[UIImage imageNamed:@"usrImage3"] forState:UIControlStateNormal];
    [self setButton:button4];
    [button4 setBackgroundImage:[UIImage imageNamed:@"usrImage4"] forState:UIControlStateNormal];
    [self setButton:button5];
    [button5 setBackgroundImage:[UIImage imageNamed:@"usrImage5"] forState:UIControlStateNormal];
    [self setButton:button6];
    [button6 setBackgroundImage:[UIImage imageNamed:@"usrImage6"] forState:UIControlStateNormal];
}

-(void)setUser_name:(NSString *)new_name{
    if(_user_name != new_name){
        _user_name = new_name;
    }
}

-(void)showAlert{
    UIAlertController * alert= [UIAlertController
                                alertControllerWithTitle:@"Warning"
                                message:@"Are you sure you wanna change the user image!"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             NSString* str = [self readStringFromFile];
                             [self writeToFile:[self changeJson:str]];
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

-(IBAction)button1action:(id)sender{
    img_name = @"usrImage1";
    [self showAlert];
}
-(IBAction)button2action:(id)sender{
    img_name = @"usrImage2";
    [self showAlert];
}
-(IBAction)button3action:(id)sender{
    img_name = @"usrImage3";
    [self showAlert];
}
-(IBAction)button4action:(id)sender{
    img_name = @"usrImage4";
    [self showAlert];
}
-(IBAction)button5action:(id)sender{
    img_name = @"usrImage5";
    [self showAlert];
}
-(IBAction)button6action:(id)sender{
    img_name = @"usrImage6";
    [self showAlert];
}

-(void)setButton:(UIButton*) but{
    [[but layer] setBorderWidth:1.0f];
}

- (void)setAnswerButtonLayout:(UIButton*) button{
    
    //    button.layer.cornerRadius = 45;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.layer.borderWidth = 1.0f;
    
    //    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
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

-(NSString*)changeJson:(NSString*)old_json{
    NSError* error;
    NSDictionary *old_dict = [NSJSONSerialization JSONObjectWithData:[old_json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    for(NSDictionary* one in old_dict){
        if ([[one valueForKey:@"name"] isEqualToString:_user_name]) {
            NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
            [temp setValue:_user_name forKey:@"name"];
            [temp setValue:[one valueForKey:@"id"] forKey:@"id"];
            [temp setValue:[one valueForKey:@"favor"] forKey:@"favor"];
            [temp setValue:img_name forKey:@"img"];
            [array addObject:temp];
        }else{
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
