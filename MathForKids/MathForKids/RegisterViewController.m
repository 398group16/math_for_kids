//
//  RegisterViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-16.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "RegisterViewController.h"
#import "userObjects.h"

@interface RegisterViewController (){
    userObjects* newUser;
}


@property (nonatomic, strong) NSString* filePath;
@property (nonatomic, strong) NSDictionary* scoreDict;
@property (nonatomic, strong) NSString* input_name;
@property (nonatomic, strong) NSString* select_favor;


@end

@implementation RegisterViewController
@synthesize source;
@synthesize user_favor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.source = [[NSMutableArray alloc] initWithObjects:@"Counting", @"Addition", @"Subtraction", @"Shapes", nil];
    
    UIButton *pressme = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 280, 80)];
    [pressme setTitle:@"Press me!!!" forState:UIControlStateNormal];
    pressme.backgroundColor = [UIColor lightGrayColor];
    [pressme addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pressme];
    
    self.user_favor = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 110, 280, 300)];
    self.user_favor.delegate = self;
    self.user_favor.dataSource = self;
    [self.view addSubview:self.user_favor];
    
    //This is how you manually SET(!!) a selection!
    [self.user_favor selectRow:2 inComponent:0 animated:YES];
}

//logs the current selection of the picker manually
-(void)pressed
{
    //This is how you manually GET(!!) a selection
    NSInteger row = [self.user_favor selectedRowInComponent:0];
    
    NSLog(@"%@", [source objectAtIndex:row]);
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [source count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [source objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    //    NSLog(@"%@", [source objectAtIndex:row]);
}

-(void)setImgName:(NSString *)newName{
    if (_imgName != newName) {
        _imgName = newName;
    }
}

-(void)loadScoreData{
    NSString* jsonUsers = [self readStringFromFile];
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[jsonUsers dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSNumber *temp_id = [NSNumber numberWithInteger:([dict count]+1)];
    newUser = [[userObjects alloc] initWithName:_input_name Id:temp_id favor:_select_favor img_name:_imgName];
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
    
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

-(IBAction)submit:(id)sender{
    self.input_name = [user_name text];
    
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
