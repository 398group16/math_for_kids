//
//  GameViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-27.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "GameViewController.h"
#import "ScoreViewController.h"

@interface GameViewController (){
    int scoreTime;
    int score;
    int gameCount;
    int timeCount;
    int correct;
    NSMutableArray* lastNumX;
    NSMutableArray* lastNumY;
    NSArray* imgArray;
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    scoreTime = 0;
    gameCount = 0;
    timeCount = 40;
    lastNumX = [[NSMutableArray alloc] init];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    kind.text = [NSString stringWithFormat:@"Category: %@", _name];
    [kind setFont:[UIFont boldSystemFontOfSize:18]];
    
    int wid = button1.frame.size.width - [UIImage imageNamed: @"normal_face"].size.width;
    int hei = button1.frame.size.height - [UIImage imageNamed: @"normal_face"].size.height;
    
    [[button1 layer] setCornerRadius:4.0f];
    [[button1 layer] setBorderWidth:1.0f];
    [[button1 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [button1 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
    [button1.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    button1.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
    [button1 setAlpha:0.9];

    [[button2 layer] setCornerRadius:4.0f];
    [[button2 layer] setBorderWidth:1.0f];
    [[button2 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [button2 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
    button2.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
    [button2.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [button2 setAlpha:0.9];
  
    [[button3 layer] setCornerRadius:4.0f];
    [[button3 layer] setBorderWidth:1.0f];
    [[button3 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [button3 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
    button3.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
    [button3.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [button3 setAlpha:0.9];
    
    [[button4 layer] setCornerRadius:4.0f];
    [[button4 layer] setBorderWidth:1.0f];
    [[button4 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [button4 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
    button4.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
    [button4.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [button4 setAlpha:0.9];
    
    [[next layer] setCornerRadius:4.0f];
    [[next layer] setBorderWidth:1.0f];
    [[next layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [next setBackgroundColor:[UIColor blackColor]];
    [next.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [next setAlpha:0.83];
    
    [[finish layer] setCornerRadius:4.0f];
    [[finish layer] setBorderWidth:1.0f];
    [[finish layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [finish setBackgroundColor:[UIColor blackColor]];
    [finish.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [finish setAlpha:0.83];
    
    [[skip layer] setCornerRadius:4.0f];
    [[skip layer] setBorderWidth:1.0f];
    [[skip layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [skip.titleLabel setFont:[UIFont boldSystemFontOfSize:21]];
    [skip setBackgroundColor:[UIColor blackColor]];
    [skip setAlpha:0.72];
    
    next.hidden = YES;
    next.enabled = NO;
    finish.hidden = YES;
    finish.enabled = NO;

    [self loadImages];
    [self setQuestion];
    [self setButtons];
    
    /*set animation*/
//    [UIView beginAnimations: nil context: nil];
//    [UIView setAnimationDuration:0.75];
//    [UIView commitAnimations];
    [time setTextColor:[UIColor greenColor]];
    time.text = [NSString stringWithFormat:@"%d", timeCount];
    [[time layer] setBackgroundColor:[UIColor blackColor].CGColor];
    [time setAlpha: 0.83];
    [time setFont:[UIFont boldSystemFontOfSize:30]];
    [[time layer] setCornerRadius:time.frame.size.width/2];
    [[time layer] setBorderWidth:2.0f];
    [[time layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
}

-(void)loadImages{
    imgArray = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"arrow"],
                         [UIImage imageNamed:@"circle"],
                         [UIImage imageNamed:@"cone"],
                         [UIImage imageNamed:@"crescent"],
                         [UIImage imageNamed:@"cross"],
                         [UIImage imageNamed:@"cube"],
                         [UIImage imageNamed:@"cuboid"],
                         [UIImage imageNamed:@"cylinder"],
                         [UIImage imageNamed:@"heart"],
                         [UIImage imageNamed:@"hexagon"],
                         [UIImage imageNamed:@"hexagonalPrism"],
                         [UIImage imageNamed:@"octagon"],
                         [UIImage imageNamed:@"oval"],
                         [UIImage imageNamed:@"parallelogram"],
                         [UIImage imageNamed:@"pentagon"],
                         [UIImage imageNamed:@"pyramid"],
                         [UIImage imageNamed:@"rectangular"],
                         [UIImage imageNamed:@"rhombus"],
                         [UIImage imageNamed:@"sphere"],
                         [UIImage imageNamed:@"star"],
                         [UIImage imageNamed:@"trapecio"],
                         [UIImage imageNamed:@"traingle"],
                         [UIImage imageNamed:@"triangularPrism"],nil];
}

-(NSString*)getImageName:(int) index{
    NSString* str;
    switch (index) {
        case 1:
            str = @"Arrow";
            break;
        case 2:
            str = @"Circle";
            break;
        case 3:
            str = @"Cone";
            break;
        case 4:
            str = @"Crescent";
            break;
        case 5:
            str = @"Cross";
            break;
        case 6:
            str = @"Cube";
            break;
        case 7:
            str = @"Cubiod";
            break;
        case 8:
            str = @"Cylinder";
            break;
        case 9:
            str = @"Heart";
            break;
        case 10:
            str = @"Hexagon";
            break;
        case 11:
            str = @"Hexagon Prism";
            break;
        case 12:
            str = @"Octagon";
            break;
        case 13:
            str = @"Oval";
            break;
        case 14:
            str = @"Parallelogram";
            break;
        case 15:
            str = @"Pentagon";
            break;
        case 16:
            str = @"Pyramid";
            break;
        case 17:
            str = @"Rectangular";
            break;
        case 18:
            str = @"Rhombus";
            break;
        case 19:
            str = @"Sphere";
            break;
        case 20:
            str = @"Star";
            break;
        case 21:
            str = @"Trapecio";
            break;
        case 22:
            str = @"Traingle";
            break;
        case 23:
            str = @"Trangular Prism";
            break;
        default:
            break;
    }
    return str;
}

-(void)setQuestion{
    [question setBackgroundColor: [UIColor blackColor]];
    [question setAlpha:0.72];
    [question setTextColor:[UIColor cyanColor]];
    [[question layer] setCornerRadius:7.0f];
    [[question layer] setBorderWidth:2.0f];
    [[question layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    if([_name isEqual:@"Counting"]){
        [question setText:@"Please count how many egg/eggs in picture: "];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else if([_name isEqual:@"Addition"]){
        [question setText:@"Please choose the answer of blow 2 numbers addition: "];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else if([_name isEqual:@"Subtraction"]){
        [question setText:@"Please choose the answer of blow 2 numbers subtraction: "];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else if([_name isEqual:@"Shape"]){
        [question setText:@"Please choose the name of shape: "];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
    
    if ([_name isEqual:@"Counting"] || [_name isEqual:@"Shape"]) {
        imageField.hidden = NO;
        txtField.hidden = YES;
        [[imageField layer] setBorderWidth:1.0f];
        [[imageField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[imageField layer] setCornerRadius:10.0f];
        [imageField setAlpha:0.93];
    }else{
        imageField.hidden = YES;
        txtField.hidden = NO;
        [[txtField layer] setBorderWidth:1.0f];
        [[txtField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[txtField layer] setCornerRadius:10.0f];
        [txtField setAlpha:0.93];
    }
    
    
    
}

-(void)setButtons{
    skip.enabled = YES;
    int s = 999;
    int s1 = s;
    int s2 = s;
    int s3 = s;
    int x, y;
    
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button3 setBackgroundColor:[UIColor blackColor]];
    [button4 setBackgroundColor:[UIColor blackColor]];
    
    if([_name isEqual:@"Counting"]){
        /*set random correct answers and random wrong answers, make sure no repeat questions*/
        x = arc4random_uniform(21);
        while(x == 0){ // make sure there is no zero in our question
            x = arc4random_uniform(21);
        }
        bool repeat = false;
        if (lastNumX.count != 0) {
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNumX.count; i++){
                    if(x == [[lastNumX objectAtIndex:i] integerValue]){
                        x = arc4random_uniform(21);
                        while(x == 0){ // make sure there is no zero in our question
                            x = arc4random_uniform(21);
                        }
                        repeat = false;
                    }
                }
            }
        }
        s = x;
        [lastNumX addObject:[NSNumber numberWithInteger:x]];
        NSLog(@"%d", x);
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"egg%d.png",s]];
        NSLog(@"egg%d.png", s);
        [imageField setImage:img];
        [imageField setBackgroundColor:[UIColor blackColor]];
        
        /*randomly set each buttons title*/
        if(s > 7 && s <= 14){
            s1 = s-3;
            s2 = s+2;
            s3 = s-1;
        }else if(s <= 7){
            s1 = s+1;
            s2 = s+2;
            s3 = s+3;
        }else{
            s1 = s-3;
            s2 = s-2;
            s3 = s-1;
        }
//        NSLog(@"%d, %d, %d, %d", x, x1, x2, x3);
        correct = arc4random_uniform(4);
    
    }else if([_name isEqual:@"Addition"]){
        
        /*set random correct answers and random wrong answers, make sure no repeat questions*/
        x = arc4random_uniform(21);
        y = arc4random_uniform(21);
        while(x == 0 || y == 0){ // make sure there is no zero in our question
            x = arc4random_uniform(21);
            y = arc4random_uniform(21);
        }
        bool repeat = false;
        if (lastNumX.count != 0) {
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNumX.count; i++){
                    if(x == [[lastNumX objectAtIndex:i] integerValue]){
                        x = arc4random_uniform(21);
                        while(x == 0){ // make sure there is no zero in our question
                            x = arc4random_uniform(21);
                        }
                        repeat = false;
                    }
                }
            }
        }
        [lastNumX addObject:[NSNumber numberWithInteger:x]];
        
        if (lastNumY.count != 0) {
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNumY.count; i++){
                    if(y == [[lastNumY objectAtIndex:i] integerValue]){
                        y = arc4random_uniform(21);
                        while(y == 0){ // make sure there is no zero in our question
                            y = arc4random_uniform(21);
                        }
                        repeat = false;
                    }
                }
            }
        }
        [lastNumY addObject:[NSNumber numberWithInteger:y]];
        
        
        s = x+y;
        NSLog(@"%d + %d = %d", x, y, s);
        [txtField setBackgroundColor:[UIColor blackColor]];
        [txtField setTextColor:[UIColor cyanColor]];
        [txtField setFont:[UIFont boldSystemFontOfSize:50]];
        
        [txtField setText:[NSString stringWithFormat:@"%d + %d = ?", x, y]];
    
        if (s <= 13) {
            s1 = s+1;
            s2 = s+2;
            s3 = s+3;
        }else if (s > 13 && s <= 26){
            s1 = s+1;
            s2 = s-1;
            s3 = s-2;
        }else{
            s1 = s-1;
            s2 = s-2;
            s3 = s-3;
        }
        
        correct = arc4random_uniform(4);
        
        
    }else if([_name isEqual:@"Subtraction"]){
        
        /*set random correct answers and random wrong answers, make sure no repeat questions*/
        x = arc4random_uniform(21);
        y = arc4random_uniform(21);
        while(x == 0 || y == 0){ // make sure there is no zero in our question
            x = arc4random_uniform(21);
            y = arc4random_uniform(21);
        }
        bool repeat = false;
        if (lastNumX.count != 0) {
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNumX.count; i++){
                    if(x == [[lastNumX objectAtIndex:i] integerValue]){
                        x = arc4random_uniform(21);
                        while(x == 0){ // make sure there is no zero in our question
                            x = arc4random_uniform(21);
                        }
                        repeat = false;
                    }
                }
            }
        }
        [lastNumX addObject:[NSNumber numberWithInteger:x]];
        
        if (lastNumY.count != 0) {
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNumY.count; i++){
                    if(y == [[lastNumY objectAtIndex:i] integerValue]){
                        y = arc4random_uniform(21);
                        while(y == 0){ // make sure there is no zero in our question
                            y = arc4random_uniform(21);
                        }
                        repeat = false;
                    }
                }
            }
        }
        [lastNumY addObject:[NSNumber numberWithInteger:y]];
        
        [txtField setBackgroundColor:[UIColor blackColor]];
        [txtField setTextColor:[UIColor cyanColor]];
        [txtField setFont:[UIFont boldSystemFontOfSize:50]];
        if(x>y){
            s = x-y;
            [txtField setText:[NSString stringWithFormat:@"%d - %d = ?", x, y]];
        }else{
            s = y-x;
            [txtField setText:[NSString stringWithFormat:@"%d - %d = ?", y, x]];
        }
        
        NSLog(@"%d, %d = %d", x, y, s);
        
        if (s <= 13) {
            s1 = s+1;
            s2 = s+2;
            s3 = s+3;
        }else if (s > 13 && s <= 26){
            s1 = s+1;
            s2 = s-1;
            s3 = s-2;
        }else{
            s1 = s-1;
            s2 = s-2;
            s3 = s-3;
        }
        
        correct = arc4random_uniform(4);
    }else{
        /*set random correct answers and random wrong answers, make sure no repeat questions*/
        x = arc4random_uniform(23);
        NSLog(@"count: %d",x);
        bool repeat = false;
        if (lastNumX.count != 0) {
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNumX.count; i++){
                    if(x == [[lastNumX objectAtIndex:i] integerValue]){
                        x = arc4random_uniform((int)imgArray.count);
                        repeat = false;
                    }
                }
            }
        }
        s = x;
        [lastNumX addObject:[NSNumber numberWithInteger:x]];
        NSLog(@"%d", x);
        UIImage* img = [imgArray objectAtIndex: s];
        [imageField setImage:img];
        [imageField setBackgroundColor:[UIColor blackColor]];
        
        /*randomly set each buttons title*/
        if(s > 7 && s <= 14){
            s1 = s-3;
            s2 = s+2;
            s3 = s-1;
        }else if(s <= 7){
            s1 = s+1;
            s2 = s+2;
            s3 = s+3;
        }else{
            s1 = s-3;
            s2 = s-2;
            s3 = s-1;
        }
        //        NSLog(@"%d, %d, %d, %d", x, x1, x2, x3);
        correct = arc4random_uniform(4);
        NSString* str = [self getImageName:s+1];
        NSString* str1 = [self getImageName:s1+1];
        NSString* str2 = [self getImageName:s2+1];
        NSString* str3 = [self getImageName:s3+1];
        

        if(correct == 0){
            [button1 setTitle:[NSString stringWithFormat:@"%@", str] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%@", str2] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%@", str1] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%@", str3] forState:UIControlStateNormal];
            
        }else if(correct == 1){
            [button1 setTitle:[NSString stringWithFormat:@"%@", str1] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%@", str] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%@", str2] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%@", str3] forState:UIControlStateNormal];
            
        }else if(correct == 2){
            [button1 setTitle:[NSString stringWithFormat:@"%@", str2] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%@", str1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%@", str] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%@", str3] forState:UIControlStateNormal];
            
        }else{
            [button1 setTitle:[NSString stringWithFormat:@"%@", str2] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%@", str1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%@", str3] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%@", str] forState:UIControlStateNormal];
        }
    }
    if (![_name isEqual:@"Shape"]) {
        
        if(correct == 0){
            [button1 setTitle:[NSString stringWithFormat:@"%d", s] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", s2] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", s1] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", s3] forState:UIControlStateNormal];
            
        }else if(correct == 1){
            [button1 setTitle:[NSString stringWithFormat:@"%d", s1] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", s] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", s2] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", s3] forState:UIControlStateNormal];
            
        }else if(correct == 2){
            [button1 setTitle:[NSString stringWithFormat:@"%d", s2] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", s1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", s] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", s3] forState:UIControlStateNormal];
            
        }else{
            [button1 setTitle:[NSString stringWithFormat:@"%d", s2] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", s1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", s3] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", s] forState:UIControlStateNormal];
        }
    }
    
}

-(void)countDown{
    timeCount -= 1;
    time.text = [NSString stringWithFormat:@"%d", timeCount];
    
    /*according to different remain time number, changing the color of time number*/
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration:0.5];
    
    if (timeCount > 20) {
        [time setTextColor:[UIColor greenColor]];
        [time setFont:[UIFont boldSystemFontOfSize:30]];
    }else if(timeCount > 10 && timeCount <= 20){
        [time setTextColor:[UIColor orangeColor]];
        [time setFont:[UIFont boldSystemFontOfSize:30]];
    }else{
        [time setTextColor:[UIColor redColor]];
        [time setFont:[UIFont boldSystemFontOfSize:30]];
    }
    [UIView commitAnimations];
    
    /*set animation, if the time is running out*/
    if(timeCount == 0){
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationDuration:0.75];
        
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
        
        if(correct == 0){
            [button1 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
            [button1  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        }else if(correct == 1){
            [button2 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
            [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button2  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        }else if(correct == 2){
            [button3 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
            [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button3  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        }else{
            [button4 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
            [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
            [button4  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        }
        button1.enabled = NO;
        button2.enabled = NO;
        button3.enabled = NO;
        button4.enabled = NO;
        skip.enabled = NO;
        
        if(gameCount+1 < 10){
            next.hidden = NO;
            next.enabled = YES;
        }else{
            finish.hidden = NO;
            finish.enabled = YES;
        }
        
        [UIView commitAnimations];
    
        [timer invalidate];
    }
}

-(void)refreshView{
    gameCount++;
    timeCount = 40;
    [time setTextColor:[UIColor greenColor]];
    if(gameCount < 10){
        int wid = button1.frame.size.width - [UIImage imageNamed: @"normal_face"].size.width;
        int hei = button1.frame.size.height - [UIImage imageNamed: @"normal_face"].size.height;
        [button1 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
        button1.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
        [button2 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
        button2.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
        [button3 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
        button3.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
        [button4 setImage:[UIImage imageNamed: @"normal_face"] forState:UIControlStateNormal];
        button4.imageEdgeInsets = UIEdgeInsetsMake(hei/2, wid-10, hei/2, 10);
        [self setQuestion];
        [self setButtons];
    
        time.text = [NSString stringWithFormat:@"%d", timeCount];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        
        button1.enabled = YES;
        button2.enabled = YES;
        button3.enabled = YES;
        button4.enabled = YES;
    }
}

-(void)setUsrName:(NSString *)newName{
    if(_usrName != newName){
        _usrName = newName;
    }
}

-(void)setCategory:(NSString*)cateName{
    if(_name != cateName){
        _name = cateName;
    }
}

-(IBAction)nextAction:(id)sender{
    next.hidden = YES;
    next.enabled = NO;
    [self refreshView];
}

-(IBAction)skipAction:(id)sender{
    [timer invalidate];
    score = score+0;
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration:0.75];
    
    [question setText:@"Sorry, it is wrong."];
    [question setTextColor:[UIColor redColor]];
    [question setFont:[UIFont boldSystemFontOfSize:18]];
    
    if(correct == 0){
        [button1 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        [button1  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
    }else if(correct == 1){
        [button2 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
    }else if(correct == 2){
        [button3 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
    }else{
        [button4 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
    }
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;
    skip.enabled = NO;
    
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    [UIView commitAnimations];
}

-(IBAction)button1action:(id)sender1{
    [timer invalidate];
    scoreTime = timeCount/4;

    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration:0.75];
    
    if(correct == 0){
        [button1 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        [button1  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        score = score+scoreTime+50;
    }else if(correct == 1){
        [button1 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button2 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
    }else if(correct == 2){
        [button1 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button3 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
    }else{
        [button1 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button4 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
    }
    
    if(correct == 0){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
    
    [UIView commitAnimations];
    
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;
    skip.enabled = NO;
    
}

-(IBAction)button2action:(id)sender2{
    [timer invalidate];
    scoreTime = timeCount/4;
    
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration:0.75];
    
    
    if(correct == 0){
        [button1  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button2 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else if(correct == 1){
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button2 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        score = score+scoreTime+50;
    }else if(correct == 2){
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button2 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button3 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else{
        [button1  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3  setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button2 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button4 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }
    
    if(correct == 1){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
    
    [UIView commitAnimations];
    
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;
    skip.enabled = NO;
}

-(IBAction)button3action:(id)sender3{
    [timer invalidate];
    scoreTime = timeCount/4;
    
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration:0.75];
    
    
    if(correct == 0){
        [button1 setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button3 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else if(correct == 1){
        [button1 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2 setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button3 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button2 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else if(correct == 2){
        [button1 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3 setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button3 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        score = score+scoreTime+50;
    }else{
        [button1 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3 setBackgroundColor:[UIColor colorWithRed:170.f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4 setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        
        [button3 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button4 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }
    
    if(correct == 2){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
    
    [UIView commitAnimations];
    
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;
    skip.enabled = NO;
}

-(IBAction)button4action:(id)sender{
    [timer invalidate];
    scoreTime = timeCount/4;
    
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration:0.75];
    
    
    if(correct == 0){
        [button1 setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button2 setBackgroundColor:[UIColor redColor]];
        [button3 setBackgroundColor:[UIColor redColor]];
        [button4 setBackgroundColor:[UIColor redColor]];
        
        [button4 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else if(correct == 1){
        [button1 setBackgroundColor:[UIColor redColor]];
        [button2 setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button3 setBackgroundColor:[UIColor redColor]];
        [button4 setBackgroundColor:[UIColor redColor]];
        
        [button4 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button2 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else if(correct == 2){
        [button1  setBackgroundColor:[UIColor redColor]];
        [button2  setBackgroundColor:[UIColor redColor]];
        [button3  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
        [button4  setBackgroundColor:[UIColor redColor]];
        
        [button4 setImage:[UIImage imageNamed: @"sad_face.png"] forState:UIControlStateNormal];
        [button3 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
    }else{
        [button1  setBackgroundColor:[UIColor redColor]];
        [button2  setBackgroundColor:[UIColor redColor]];
        [button3  setBackgroundColor:[UIColor redColor]];
        [button4  setBackgroundColor:[UIColor colorWithRed:8.0f/255.0f green:170.f/255.0f blue:8.0f/255.0f alpha:1.0f]];
         
        [button4 setImage:[UIImage imageNamed: @"happy_face.png"] forState:UIControlStateNormal];
        
        score = score+scoreTime+50;
    }
    

    if(correct == 3){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
    
    [UIView commitAnimations];
    
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;
    skip.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    score = (score*100)/500;
    NSLog(@"Score: %d", score);
    if([[segue identifier] isEqualToString:@"scoreDetail"]){
        ScoreViewController* dest = segue.destinationViewController;
        dest.title = [NSString stringWithFormat:@"%@", _name];
        NSString* temp = [NSString stringWithFormat:@"%d", score];
        [[segue destinationViewController] setScore: temp];
        [[segue destinationViewController] setUsrName:_usrName];
    }
}


@end
