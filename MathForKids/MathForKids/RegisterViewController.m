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
    userObjects* newUser; // new user account which user wanna add in local json library
    NSString* input_name; // user name
    NSString* select_favor; // user favourate game
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
    
    [self setAnswerButtonLayout:(shadowButton)];
    
    source = [[NSMutableArray alloc] initWithObjects:@"Counting",@"Addition",@"Subtraction",@"Shapes", nil];
    user_favor.delegate = self;
    UIImage* img = [UIImage imageNamed:_imgName];
    [user_img setImage:img];
//    user_favor.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    user_favor.layer.cornerRadius = 4.0f;
    [self->user_favor selectRow:2 inComponent:0 animated:YES];
    
}

/*set picker view for four kinds of children favorite game */
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
/*set picker view for four kinds of children favorite game */

-(void)setImgName:(NSString *)newName{
    if (_imgName != newName) {
        _imgName = newName;
    }
}

-(void)loadUserData{
    NSString* jsonUsers = [self readStringFromFile];
//    NSLog(@"json: %@", jsonUsers);
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[jsonUsers dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error]; // initialize a NSDictionary
    NSNumber *temp_id = [NSNumber numberWithInteger:([dict count]+1)];
    select_favor = [source objectAtIndex:2];

    if ([input_name  isEqual: @""] || select_favor == nil) { // check user enter all the fields or not
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
        for (NSDictionary* one in dict) { // check user entered user name is used or not
            NSString* temp_name = [one valueForKey:@"name"];
            
            NSCharacterSet *charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@"()  \n\""];// delete space and ()
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
        if (!repeat) { // if user name is vaild and non-repeated, then record everything in user account json library
            if (_imgName == nil) {
                _imgName = [NSString stringWithFormat:@"Empty"];
            }
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
            NSString* combine = [self appendJsonFile:jsonUsers newJson:str];
            [self writeToFile:combine];
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
            
            UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            [vc presentViewController:alert animated:YES completion:nil];
        }
    }
}

/*add new user account to local json library*/
-(NSString*)appendJsonFile:(NSString*)oldJson
                   newJson:(NSString*)newJson{
    NSError* error;
    NSDictionary *old_dict = [NSJSONSerialization JSONObjectWithData:[oldJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    error = nil;
    NSDictionary* new_dict = [NSJSONSerialization JSONObjectWithData:[newJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];// initial a new array
    
    if ([old_dict count] > 0) { // add all users which are already exist in old local library
        for(NSDictionary* one in old_dict){
            [array addObject:one];
        }
    }
    [array addObject:new_dict];// add new one
    
    error = nil; // transfer array to json format data
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

/*write json string to local json library*/
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

/*get all the user account information from local json library*/
- (NSString*)readStringFromFile{
    // Build the path...
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"users.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];

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

/* hide keyboard wi=hen user finish typing */
- (IBAction)textFieldDimiss:(id)sender {
    [user_name resignFirstResponder];
}

/* when keyboard show, then screen will move up, otherwise, screen will show normally*/
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}

- (void)keyboardDidShow:(NSNotification *)notification{
    // Assign new frame to your view
    originFrame = self.view.frame;
    [self.view setFrame:CGRectMake(0,-110,originFrame.size.width,originFrame.size.height)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification{
    [self.view setFrame:CGRectMake(0,0,originFrame.size.width,originFrame.size.height)];
}
/* when keyboard show, then screen will move up, otherwise, screen will show normally*/
@end
