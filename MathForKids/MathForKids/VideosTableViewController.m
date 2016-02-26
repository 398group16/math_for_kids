//
//  VideosTableViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "VideosTableViewController.h"
#import "YoutubeViewController.h"

@interface VideosTableViewController ()
@property NSArray *objects;
@end

@implementation VideosTableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self readJsonFromFile];
    [self.tableView reloadData];
    
}

-(NSString *)verify{
    NSString* str = self.navigationItem.title;
    
    if ([str  isEqual: @"Counting"]) {
        str = @"count_links";
    }else if([str  isEqual: @"Addition"]){
        str = @"add_links";
    }else if([str  isEqual: @"Subtraction"]){
        str = @"sub_links";
    }else if([str  isEqual: @"Shape"]){
        str = @"shape_links";
    }
//    NSLog(@"file: %@", str);
    return str;
}

-(void)readJsonFromFile{
    NSString* str = self.verify;
    NSString* filePath = [[NSBundle mainBundle] pathForResource: str ofType:@"json"];
//    NSLog(@"file path: %@", filePath);
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    self.objects = (NSArray*) [NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected cell");
    [self performSegueWithIdentifier:@"youtubeDetail" sender:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    
    if ( cell == nil )
    {
        cell = [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"Cell" ];
    }
    
    
    id pairValue = self.objects[indexPath.row];
    
    cell.textLabel.text = pairValue[@"name"];
    cell.imageView.image = [ UIImage imageNamed: @"youtubeIcon.jpeg" ];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"URL: %@", pairValue[@"url"]];
    
    // Configure the cell...
    
    return cell;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"1111");
    if ([[segue identifier] isEqualToString:@"youtubeDetail"]){
        YoutubeViewController* dest = segue.destinationViewController;
        dest.title = @"YouTube";
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        id pairValue = self.objects[indexPath.row];
        NSString* object = pairValue[@"url"];
        [[segue destinationViewController] setDetailItem:object];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

