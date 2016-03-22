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
#import "addCells.h"

@interface RootViewController (){
    NSString* userName;
    NSString* userImg;
}

@end

@implementation RootViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [user_col reloadData]; // to reload selected cell
    [self loadUserData];
    [self setAnswerButtonLayout:(signB)];
    [user_col setDataSource:self];
    [user_col setDelegate:self];
    [user_col setNeedsDisplay];
    
    NSArray *viewControllers = [[self navigationController] viewControllers];
    NSLog(@"Views in the stack after viewWillAppear: %@",viewControllers);
}

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
    
    /* Get the current array of View Controllers */
    NSArray *currentControllers = self.navigationController.viewControllers;
    
    
    NSInteger size = [currentControllers count];
    NSLog(@"there are %ld objects in the array", (long)size);
    
//    if([currentControllers count]==4){
//        /* Create a mutable array out of this array */
//        NSMutableArray *newControllers = [NSMutableArray
//                                          arrayWithArray:currentControllers];
//        
//        NSLog(@"Views in mutable array before deletion: %@",newControllers);
//        
//        /* Remove the last object from the array */
//        [newControllers removeObjectAtIndex:0];
//        [newControllers removeObjectAtIndex:0];
//        [newControllers removeObjectAtIndex:0];
//        
//        
//        NSLog(@"Views in mutable array after deletion: %@",newControllers);
//        /* Assign this array to the Navigation Controller */
//        
//        
//        [self.navigationController setViewControllers:newControllers
//                                             animated:YES];
//        self.navigationController.viewControllers = newControllers;
//        
//        NSLog(@"Views in vieController array after deletion: %@",self.navigationController.viewControllers);
//    }
    
    NSArray *viewControllers = [[self navigationController] viewControllers];
    NSLog(@"Views in the stack at user rootView: %@",viewControllers);
    
    
    [self loadUserData];
    [self setAnswerButtonLayout:(signB)];
    
    
    [user_col setDataSource:self];
    [user_col setDelegate:self];
    
    
//    [user_col setAlpha:0.0];
    [[user_col layer] setBorderColor:[UIColor clearColor].CGColor];
    [[user_col layer] setBorderWidth:1.0f];
    [[user_col layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[user_col layer] setCornerRadius:10.0f];
    
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
//    NSLog(@"%@", filePath);
    // The main act...
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

//-(IBAction)skipToHomeView:(id)sender{
//    HomeViewController* myHome = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
//    
//    UINavigationController* enclosingNav = [ [ UINavigationController alloc ] initWithRootViewController: myHome ];
//    
//    [ self presentViewController: enclosingNav animated: YES
//                      completion: nil ];
//}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [userAccounts count]+1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSDictionary* one = userAccounts[indexPath.row];
//    NSString* name = [one valueForKey:@"name"];
//    NSString* img = [one valueForKey:@"img"];
    
    if (indexPath.row == 0) {
        addCells* cell = (addCells*)[collectionView dequeueReusableCellWithReuseIdentifier:@"addCells" forIndexPath:indexPath];
        [cell loadCellTitle:@"Add User"];
        [cell loadCellImg:@"addUser"];
        
        cell.layer.masksToBounds = NO;
        [[cell layer] setBorderWidth:1.0f];
        [[cell layer] setBorderColor:[UIColor blackColor].CGColor];
        
        [cell.layer setShadowColor:[UIColor blackColor].CGColor];
        [cell.layer setShadowOpacity:0.8];
        [cell.layer setShadowRadius:3.0];
        [cell.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        return cell;
        
    }else{
        NSDictionary* one = userAccounts[indexPath.row-1];
        NSString* name = [one valueForKey:@"name"];
        NSString* img = [one valueForKey:@"img"];
        
        userCells* cell = (userCells*)[collectionView dequeueReusableCellWithReuseIdentifier:@"userCells" forIndexPath:indexPath];
        [cell loadCellLabel:name];
        
        
        cell.layer.masksToBounds = NO;
        [[cell layer] setBorderWidth:1.0f];
        [[cell layer] setBorderColor:[UIColor blackColor].CGColor];
        
        [cell.layer setShadowColor:[UIColor blackColor].CGColor];
        [cell.layer setShadowOpacity:0.8];
        [cell.layer setShadowRadius:3.0];
        [cell.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        //    [[cell layer] setCornerRadius:10.0f];
        //    cell.clipsToBounds=YES;
        
        
        [cell loadCellImg:img];
        return cell;
    }
    
//    return cell;
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
