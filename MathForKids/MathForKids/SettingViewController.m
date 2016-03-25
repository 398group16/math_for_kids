//
//  SettingViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setUser_name:(NSString *)new_name{
    if(_user_name != new_name){
        _user_name = new_name;
    }
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
                                alertControllerWithTitle:@"Error"
                                message:@"Are you sure you wanna delete this user account!"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             NSString* str = [self readStringFromFile];
                             [self writeToFile:[self deleteJson:str]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
