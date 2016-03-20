//
//  RootViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "userObjects.h"
#import "userCells.h"

@interface RootViewController (){
    NSString* userName;
    NSString* userImg;
}

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            //intialize our data to be stored in the json file
    }
    return self;
}

- (void)setAnswerButtonLayout:(UIButton*) button{
    
    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
} //    [self setAnswerButtonLayout:(compare)];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[signB layer] setCornerRadius:4.0f];
//    [[signB layer] setBorderWidth:1.0f];
//    [[signB layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [self loadUserData];
    [self setAnswerButtonLayout:(signB)];
    [user_col setDataSource:self];
    [user_col setDelegate:self];
    
//    usrImage1.layer.cornerRadius = 45;
//    usrImage1.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    usrImage1.layer.borderWidth = 1.0f;
//    
//    usrImage2.layer.cornerRadius = 45;
//    usrImage2.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    usrImage2.layer.borderWidth = 1.0f;
//    
//    usrImage3.layer.cornerRadius = 45;
//    usrImage3.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    usrImage3.layer.borderWidth = 1.0f;
    
    self.navigationItem.title = @"Math For Kids";
}

-(void)loadUserData{
    NSString* json_users = [self readStringFromFile];
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[json_users dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];

    userAccounts = [[NSMutableArray alloc] init];
    
    if ([dict count] > 0) {
        for(NSDictionary* one in dict){
            [userAccounts addObject:one];
        }
    }
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

-(IBAction)skipToHomeView:(id)sender{
    HomeViewController* myHome = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    UINavigationController* enclosingNav = [ [ UINavigationController alloc ] initWithRootViewController: myHome ];
    
    [ self presentViewController: enclosingNav animated: YES
                      completion: nil ];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [userAccounts count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* one = userAccounts[indexPath.row];
    NSString* name = [one valueForKey:@"name"];
    NSString* img = [one valueForKey:@"img"];
    
    userCells* cell = (userCells*)[collectionView dequeueReusableCellWithReuseIdentifier:@"userCells" forIndexPath:indexPath];
    [cell loadCellLabel:name];
    [cell loadCellImg:img];
    
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"homeDetail"]) {
        [[segue destinationViewController] setUsrName: userName];
    }else if([[segue identifier] isEqualToString:@"homeUserDetail"]){
        
        NSArray *indexPaths = [user_col indexPathsForSelectedItems];
//        HomeViewController *dest = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        UICollectionViewCell *select_cell = [user_col cellForItemAtIndexPath:indexPath];
        UILabel* cell_lab = (UILabel*)[select_cell viewWithTag:1];
        UIImageView* cell_img = (UIImageView*)[select_cell viewWithTag:2];
//        NSLog(@"%@", cell_lab.text);
        [[segue destinationViewController] setUsrName: [cell_lab text]];
        [[segue destinationViewController] setUser_img: [cell_img image]];
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
