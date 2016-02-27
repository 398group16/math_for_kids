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
        
        UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 50)];
        [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count1"]]];
        [field addSubview: imageView1];
        
        UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 100, 350, 320)];
        [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count2"]]];
        [field addSubview: imageView2];
        
        UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 470, 360, 180)];
        [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count3"]]];
        [field addSubview: imageView3];
        
        UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 700, 350, 224)];
        [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count4"]]];
        [field addSubview: imageView4];
        
        field.contentSize = CGSizeMake(398, 1000);
        
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
        
        UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 175)];
        [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub1"]]];
        [field addSubview: imageView1];
        
        UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 225, 360, 293)];
        [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub2"]]];
        [field addSubview: imageView2];
        
        UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 565, 350, 185)];
        [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub3"]]];
        [field addSubview: imageView3];
        
        UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 800, 350, 100)];
        [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub4"]]];
        [field addSubview: imageView4];
        
        UIImageView* imageView5 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 950, 350, 280)];
        [imageView5 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub5"]]];
        [field addSubview: imageView5];
        
        field.contentSize = CGSizeMake(398, 1250);
        
    }else if([str  isEqual: @"Shape"]){
        
        UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 360)];
        [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape1"]]];
        [field addSubview: imageView1];
        
        UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 400, 350, 350)];
        [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape2"]]];
        [field addSubview: imageView2];
        
        UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 800, 360, 350)];
        [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape3"]]];
        [field addSubview: imageView3];
        
        UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 1200, 350, 225)];
        [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape4"]]];
        [field addSubview: imageView4];
        
        UIImageView* imageView5 = [[UIImageView alloc] initWithFrame: CGRectMake(34, 1475, 330, 345)];
        [imageView5 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape5"]]];
        [field addSubview: imageView5];
        
        UIImageView* imageView6 = [[UIImageView alloc] initWithFrame: CGRectMake(34, 1820, 330, 345)];
        [imageView6 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape6"]]];
        [field addSubview: imageView6];
        
        field.contentSize = CGSizeMake(398, 2170);
    }

}

-(IBAction)toCountView:(id)sender{
    //    CountingViewController* myCount = [[CountingViewController alloc] initWithNibName:@"CountingViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:myCount animated: YES];
    self.navigationItem.title = @"Counting";
    
    for (UIImageView *view in field.subviews) {
        
        [view removeFromSuperview];
        
    }
    
    UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 50)];
    [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count1"]]];
    [field addSubview: imageView1];
    
    UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 100, 350, 320)];
    [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count2"]]];
    [field addSubview: imageView2];
    
    UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 470, 360, 180)];
    [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count3"]]];
    [field addSubview: imageView3];
    
    UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 700, 350, 224)];
    [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"count4"]]];
    [field addSubview: imageView4];
    
    field.contentSize = CGSizeMake(398, 1000);
    
}

-(IBAction)toAddView:(id)sender{
    //    AdditionViewController* myAdd = [[AdditionViewController alloc] initWithNibName:@"AdditionViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:myAdd animated: YES];
    self.navigationItem.title = @"Addition";
    
    for (UIImageView *view in field.subviews) {
        
        [view removeFromSuperview];
        
    }
    
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
}

-(IBAction)toSubView:(id)sender{
    //    SubtractionViewController* mySub = [[SubtractionViewController alloc] initWithNibName:@"SubtractionViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:mySub animated: YES];
    self.navigationItem.title = @"Subtraction";
    
    for (UIImageView *view in field.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 175)];
    [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub1"]]];
    [field addSubview: imageView1];
    
    UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 225, 360, 293)];
    [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub2"]]];
    [field addSubview: imageView2];
    
    UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 565, 350, 185)];
    [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub3"]]];
    [field addSubview: imageView3];
    
    UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 800, 350, 100)];
    [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub4"]]];
    [field addSubview: imageView4];
    
    UIImageView* imageView5 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 950, 350, 280)];
    [imageView5 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"sub5"]]];
    [field addSubview: imageView5];
    
    field.contentSize = CGSizeMake(398, 1250);
}

-(IBAction)toShapeView:(id)sender{
    //    ShapeViewController* myShape = [[ShapeViewController alloc] initWithNibName:@"ShapeViewController" bundle:nil];
    //
    //    [ self.navigationController pushViewController:myShape animated: YES];
    self.navigationItem.title = @"Shape";
    
    for (UIImageView *view in field.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView* imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 0, 350, 360)];
    [imageView1 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape1"]]];
    [field addSubview: imageView1];
    
    UIImageView* imageView2 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 400, 350, 350)];
    [imageView2 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape2"]]];
    [field addSubview: imageView2];
    
    UIImageView* imageView3 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 800, 360, 350)];
    [imageView3 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape3"]]];
    [field addSubview: imageView3];
    
    UIImageView* imageView4 = [[UIImageView alloc] initWithFrame: CGRectMake(24, 1200, 350, 225)];
    [imageView4 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape4"]]];
    [field addSubview: imageView4];
    
    UIImageView* imageView5 = [[UIImageView alloc] initWithFrame: CGRectMake(34, 1475, 330, 345)];
    [imageView5 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape5"]]];
    [field addSubview: imageView5];
    
    UIImageView* imageView6 = [[UIImageView alloc] initWithFrame: CGRectMake(34, 1820, 330, 345)];
    [imageView6 setImage: [UIImage imageNamed:[NSString stringWithFormat:@"shape6"]]];
    [field addSubview: imageView6];
    
    field.contentSize = CGSizeMake(398, 2170);
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
