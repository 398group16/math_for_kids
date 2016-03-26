//
//  SetNameViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-24.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "SetNameViewController.h"

@interface SetNameViewController (){
    NSString* newName;
}

@end

@implementation SetNameViewController

- (CGPathRef)awesomeShadow:(CGRect)rect
{
    CGSize size = rect.size;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + 15.0f)];
    
    [path addCurveToPoint:CGPointMake(0.0, size.height + 15.0f)
            controlPoint1:CGPointMake(size.width - 15.0f, size.height)
            controlPoint2:CGPointMake(15.0f, size.height)];
    
    return path.CGPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Change username";
    
    submit.layer.masksToBounds = NO;
    submit.layer.shadowOffset = CGSizeZero;
    submit.layer.shadowColor = [[UIColor blackColor] CGColor];
    submit.layer.shadowRadius = 2.0f;
    submit.layer.shadowOpacity = 0.80f;
    submit.layer.shadowPath = [self awesomeShadow:submit.layer.bounds];
}

-(void)setUser_name:(NSString *)new_name{
    if(_user_name != new_name){
        _user_name = new_name;
    }
}

-(IBAction)submitAction:(id)sender{
    
    field2.text = _user_name;
    
    if ([[field1 text]  isEqual: @""]) {
        
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Error"
                                    message:@"Please enter a username"
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
        newName = [field1 text];
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Warning"
                                    message:@"Are you sure you wanna change the user name?"
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
            [temp setValue:newName forKey:@"name"];
            [temp setValue:[one valueForKey:@"id"] forKey:@"id"];
            [temp setValue:[one valueForKey:@"favor"] forKey:@"favor"];
            [temp setValue:[one valueForKey:@"img"] forKey:@"img"];
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

-(IBAction)dismissKeyboard1:(id)sender{
    [field1 resignFirstResponder];
}

-(IBAction)dismissKeyboard2:(id)sender{
    [field2 resignFirstResponder];
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
