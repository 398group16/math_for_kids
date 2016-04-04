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
    CGRect originFrame;
}


@property (nonatomic, strong) NSString* filePath;

@end

@implementation RegisterViewController


- (void)setAnswerButtonLayout:(UIButton*) button{
    
    //    button.layer.cornerRadius = 45;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.layer.borderWidth = 1.0f;
    
    //    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(0.0f, 12.0f);
} //    [self setAnswerButtonLayout:(button)];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Enter user info";
    [self setAnswerButtonLayout:(submit)];
//    submit.layer.masksToBounds = NO;
//    submit.layer.shadowOffset = CGSizeZero;
//    submit.layer.shadowColor = [[UIColor blackColor] CGColor];
//    submit.layer.shadowRadius = 2.0f;
//    submit.layer.shadowOpacity = 0.80f;
//    submit.layer.shadowPath = [self awesomeShadow:submit.layer.bounds];
    
    [self setAnswerButtonLayout:(shadowButton)];
    
    source = [[NSMutableArray alloc] initWithObjects:@"Counting",@"Addition",@"Subtraction",@"Shapes", nil];
    user_favor.delegate = self;
    UIImage* img = [UIImage imageNamed:_imgName];
    [user_img setImage:img];
//    user_favor.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    user_favor.layer.cornerRadius = 4.0f;
    [self->user_favor selectRow:2 inComponent:0 animated:YES];
    
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
    select_favor = [source objectAtIndex:2];

    if ([input_name  isEqual: @""] || select_favor == nil) {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Error"
                                    message:@"Please enter a name."
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
                                            message:@"Please select a different name. This name is already in use."
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
//            NSLog(@"id: %@, name: %@, favor: %@, img:%@",temp_id, input_name, select_favor, _imgName);
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
                                        alertControllerWithTitle:@"Congratulations!"
                                        message:@"Profile registered. You can now play the game!"
                                        preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     NSArray *viewControllers = [[self navigationController] viewControllers];
                                     
                                     id obj=[viewControllers objectAtIndex:0];
                                     [[self navigationController] popToViewController:obj animated:YES];
                                     
                                     viewControllers = [[self navigationController] viewControllers];
                                     NSLog(@"Views in the stack at user registration: %@",viewControllers);
                                     
                                 }];
            
            [alert addAction:ok];

            
//            UIAlertAction* ok = [UIAlertAction
//                                 actionWithTitle:@"OK"
//                                 style:UIAlertActionStyleDefault
//                                 handler:^(UIAlertAction * action)
//                                 {
//                                     UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"rootID"];
//                                     [self.navigationController pushViewController:controller animated:YES];
//                                     
//                                     NSArray *viewControllers = [[self navigationController] viewControllers];
//                                      NSLog(@"Views in the stack at user registration after pressing SUBMIT: %@",viewControllers);
//                                     
//                                     // TO DO
//                                     // send straigh to homeview instead of root view
//                                     // and transfer data to that view
//                                     
//                                     
////                                     [alert dismissViewControllerAnimated:YES completion:nil];
////                                     NSArray *viewControllers = [[self navigationController] viewControllers];
////                                     
////                                     id obj=[viewControllers objectAtIndex:0];
////                                     [[self navigationController] pushViewController:obj animated:YES];
////// VISHAL, HERE
//////                                     [self.navigationController popToRootViewControllerAnimated:YES];
////                                     
////                                     viewControllers = [[self navigationController] viewControllers];
////                                     NSLog(@"Views in the stack at user registration: %@",viewControllers);
//                                 }];
//            
//            [alert addAction:ok];
            
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

- (IBAction)textFieldDimiss:(id)sender {
    [user_name resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    // Assign new frame to your view
    originFrame = self.view.frame;
    [self.view setFrame:CGRectMake(0,-110,originFrame.size.width,originFrame.size.height)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,originFrame.size.width,originFrame.size.height)];
}
@end
