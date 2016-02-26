//
//  TutDetailViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "TutDetailViewController.h"
#import "VideosTableViewController.h"

@interface TutDetailViewController ()

@end

@implementation TutDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    [[field layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[field layer] setBorderWidth:1.0f];
    
    [[ytv layer] setCornerRadius:4.0f];
    [[ytv layer] setBorderWidth:1.0f];
    [[ytv layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[Count layer] setCornerRadius:4.0f];
    [[Count layer] setBorderWidth:1.0f];
    [[Count layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[add layer] setCornerRadius:4.0f];
    [[add layer] setBorderWidth:1.0f];
    [[add layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[sub layer] setCornerRadius:4.0f];
    [[sub layer] setBorderWidth:1.0f];
    [[sub layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[shape layer] setCornerRadius:4.0f];
    [[shape layer] setBorderWidth:1.0f];
    [[shape layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    NSString* str = self.navigationItem.title;
    
    if ([str  isEqual: @"Counting"]) {
        str = @"count_links";
    }else if([str  isEqual: @"Addition"]){
        UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 233)];
        [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"add1"]]];
        [field addSubview: imageView1];
        
        UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 283, 350, 175)];
        [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"add2"]]];
        [field addSubview: imageView2];
        
        UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 508, 350, 152)];
        [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"add3"]]];
        [field addSubview: imageView3];
        
        UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 710, 350, 315)];
        [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"add4"]]];
        [field addSubview: imageView4];
        
        UIImageView* imageView5 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 1075, 350, 270)];
        [imageView5 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"add5"]]];
        [field addSubview: imageView5];
        
        UIImageView* imageView6 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 1395, 350, 257)];
        [imageView6 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"add6"]]];
        [field addSubview: imageView6];
        
        field.contentSize = CGSizeMake(398, 1700);
        
    }else if([str  isEqual: @"Subtraction"]){
        str = @"sub_links";
    }else if([str  isEqual: @"Shape"]){
        str = @"shape_links";
    }

}

-(IBAction)toCountView:(id)sender{
    //    CountingViewController* myCount = [[CountingViewController alloc] initWithNibName:@"CountingViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:myCount animated: YES];
    self.navigationItem.title = @"Counting";
}

-(IBAction)toAddView:(id)sender{
    //    AdditionViewController* myAdd = [[AdditionViewController alloc] initWithNibName:@"AdditionViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:myAdd animated: YES];
    self.navigationItem.title = @"Addition";
}

-(IBAction)toSubView:(id)sender{
    //    SubtractionViewController* mySub = [[SubtractionViewController alloc] initWithNibName:@"SubtractionViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:mySub animated: YES];
    self.navigationItem.title = @"Subtraction";
}

-(IBAction)toShapeView:(id)sender{
    //    ShapeViewController* myShape = [[ShapeViewController alloc] initWithNibName:@"ShapeViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:myShape animated: YES];
    self.navigationItem.title = @"Shape";
}

//-(IBAction)toYtVideoView:(id)sender{
//    VideosTableViewController* myVideo = [[VideosTableViewController alloc] initWithNibName:@"VideoViewController" bundle:nil];
//    [ self.navigationController pushViewController:myVideo animated: YES];
//    
//    myVideo.navigationItem.title = [NSString stringWithFormat:@"%@ %@", self.navigationItem.title, @"Videos List"];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"videoDetail"]) {
        VideosTableViewController* dest = segue.destinationViewController;
        
        dest.title = self.navigationItem.title;
    }
}


@end
