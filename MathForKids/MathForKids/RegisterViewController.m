//
//  RegisterViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-16.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "RegisterViewController.h"
#import "userObjects.h"
#import "HomeViewController.h"

@interface RegisterViewController (){
    userObjects* newUser;
    NSString* input_name;
    NSString* select_favor;
}


@property (nonatomic, strong) NSString* filePath;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    source = [[NSMutableArray alloc] initWithObjects:@"Counting",@"Addition",@"Subtraction",@"Shapes", nil];
    user_favor.delegate = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [source count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [source objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    select_favor = [source objectAtIndex:row];
    NSLog(@"%@", select_favor);
}

-(void)setImgName:(NSString *)newName{
    if (_imgName != newName) {
        _imgName = newName;
    }
}

-(void)loadUserData{
    NSString* jsonUsers = [self readStringFromFile];
//    NSLog(@"json: %@", jsonUsers);
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[jsonUsers dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSNumber *temp_id = [NSNumber numberWithInteger:([dict count]+1)];

    if (input_name == nil || select_favor == nil) {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Error"
                                    message:@"User Name and Favourite Math cannot be empty!"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        [alert addAction:ok];
        
        UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        [vc presentViewController:alert animated:YES completion:nil];
        
    }else{
        bool repeat = NO;
        for (NSDictionary* one in dict) {
            NSString* temp_name = [one valueForKey:@"name"];
            
            NSCharacterSet *charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@"()  \n\""];
            NSString* tempStr = [temp_name stringByTrimmingCharactersInSet:charsToTrim];
            input_name = [input_name stringByTrimmingCharactersInSet:charsToTrim];
            
            if ([input_name isEqualToString:tempStr]) {
                UIAlertController * alert= [UIAlertController
                                            alertControllerWithTitle:@"Error"
                                            message:@"User Name cannot be repeated!"
                                            preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* ok = [UIAlertAction
                                     actionWithTitle:@"OK"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         [alert dismissViewControllerAnimated:YES completion:nil];
                                         
                                     }];
                
                [alert addAction:ok];
                
                UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
                [vc presentViewController:alert animated:YES completion:nil];
                repeat = YES;
            }
        }
        if (!repeat) {
            if (_imgName == nil) {
                _imgName = [NSString stringWithFormat:@"Empty"];
            }
            NSLog(@"id: %@, name: %@, favor: %@, img:%@",temp_id, input_name, select_favor, _imgName);
            newUser = [[userObjects alloc] initWithName:input_name Id:temp_id favor:select_favor img_name:_imgName];
            NSMutableDictionary* dict = [newUser toNSDictionary];
            error = nil;
            NSData* jsonData = [NSJSONSerialization
                                dataWithJSONObject:dict
                                options:NSJSONWritingPrettyPrinted
                                error:&error];
            NSString *str;
            if ([jsonData length] > 0 && error == nil) {
                str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
            }
//            NSLog(@"test: %@", str);
            NSString* combine = [self appendJsonFile:jsonUsers newJson:str];
            [self writeToFile:combine];
//            NSString* temp = [self readStringFromFile];
//            NSLog(@"read: %@", temp);
            
            UIAlertController * alert= [UIAlertController
                                        alertControllerWithTitle:@"Congratulation"
                                        message:@"Register Successfully!"
                                        preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     [self.navigationController popToRootViewControllerAnimated:YES];
                                     
                                 }];
            
            [alert addAction:ok];
            
            UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            [vc presentViewController:alert animated:YES completion:nil];
        }
    }
}

-(NSString*)appendJsonFile:(NSString*)oldJson
                   newJson:(NSString*)newJson{
    NSError* error;
    NSDictionary *old_dict = [NSJSONSerialization JSONObjectWithData:[oldJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    error = nil;
    NSDictionary* new_dict = [NSJSONSerialization JSONObjectWithData:[newJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    if ([old_dict count] > 0) {
        for(NSDictionary* one in old_dict){
            [array addObject:one];
        }
    }
    
    [array addObject:new_dict];
    
    
    error = nil;
    NSData* jsonData = [NSJSONSerialization
                        dataWithJSONObject:array
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    NSString *str;
    if ([jsonData length] > 0 && error == nil) {
        str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSLog(@"combine users: %@", str);
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
    NSLog(@"%@", filePath);
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

-(IBAction)submit:(id)sender{
    input_name = [user_name text];
    [self loadUserData];
    
    
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
