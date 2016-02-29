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
    NSMutableArray* lastNum;
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    scoreTime = 0;
    gameCount = 0;
    timeCount = 10;
    lastNum = [[NSMutableArray alloc] init];
    
    kind.text = [NSString stringWithFormat:@"Category: %@", _name];
    
    [[button1 layer] setCornerRadius:4.0f];
    [[button1 layer] setBorderWidth:1.0f];
    [[button1 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[button2 layer] setCornerRadius:4.0f];
    [[button2 layer] setBorderWidth:1.0f];
    [[button2 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
  
    [[button3 layer] setCornerRadius:4.0f];
    [[button3 layer] setBorderWidth:1.0f];
    [[button3 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[button4 layer] setCornerRadius:4.0f];
    [[button4 layer] setBorderWidth:1.0f];
    [[button4 layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[next layer] setCornerRadius:4.0f];
    [[next layer] setBorderWidth:1.0f];
    [[next layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[finish layer] setCornerRadius:4.0f];
    [[finish layer] setBorderWidth:1.0f];
    [[finish layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    next.hidden = YES;
    next.enabled = NO;
    finish.hidden = YES;
    finish.enabled = NO;

    [self setQuestion];
    [self setButtons];
    
    /*set animation*/
//    [UIView beginAnimations: nil context: nil];
//    [UIView setAnimationDuration:0.75];
//    [UIView commitAnimations];
    
    time.text = [NSString stringWithFormat:@"Remain Time: %d", timeCount];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
}

-(void)saveScoreToLocalLib:(int) score{
    
}

-(void)setQuestion{
    [question setText:@"Please count how many items in picture: "];
    [question setTextColor:[UIColor blackColor]];
    [question setFont:[UIFont boldSystemFontOfSize:18]];
}

-(void)setButtons{
    
    if([_name isEqual:@"Counting"]){
        [[button1 layer] setBackgroundColor:[UIColor whiteColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor whiteColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor whiteColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor whiteColor].CGColor];
        
        /*set random correct answers and random wrong answers, make sure no repeat questions*/
        int x1, x2, x3;
        int x = arc4random_uniform(21);
        bool repeat = false;
        if (lastNum.count != 0) {
            while(x == 0){ // make sure there is no zero in our question
                x = arc4random_uniform(21);
            }
            while(repeat == false ){
                repeat = true;
                for(int i=0; i<lastNum.count; i++){
                    if(x == [[lastNum objectAtIndex:i] integerValue]){
                        x = arc4random_uniform(21);
                        while(x == 0){ // make sure there is no zero in our question
                            x = arc4random_uniform(21);
                        }
                        repeat = false;
                    }
                }
            }
        }
        [lastNum addObject:[NSNumber numberWithInteger:x]];
        NSLog(@"%d", x);
        
        /*randomly set each buttons title*/
        if(x > 7 && x <= 14){
            x1 = x-3;
            x2 = x+2;
            x3 = x-1;
        }else if(x <= 7){
            x1 = x+1;
            x2 = x+2;
            x3 = x+3;
        }else{
            x1 = x-3;
            x2 = x-2;
            x3 = x-1;
        }
        
        
//        NSLog(@"%d, %d, %d, %d", x, x1, x2, x3);
        int y = arc4random_uniform(4);
        
        correct = y;
    
        if(y == 0){
            [button1 setTitle:[NSString stringWithFormat:@"%d", x] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", x2] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", x1] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", x3] forState:UIControlStateNormal];
            
        }else if(y == 1){
            [button1 setTitle:[NSString stringWithFormat:@"%d", x1] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", x] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", x2] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", x3] forState:UIControlStateNormal];
            
        }else if(y == 2){
            [button1 setTitle:[NSString stringWithFormat:@"%d", x2] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", x1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", x] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", x3] forState:UIControlStateNormal];
            
        }else{
            [button1 setTitle:[NSString stringWithFormat:@"%d", x2] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d", x1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d", x3] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d", x] forState:UIControlStateNormal];
        }
    }

}

-(void)countDown{
    timeCount -= 1;
    time.text = [NSString stringWithFormat:@"Remain Time: %d", timeCount];
    if(timeCount == 0){
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationDuration:0.75];
        
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
        
        if(correct == 0){
            [[button1 layer] setBackgroundColor:[UIColor greenColor].CGColor];
            [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
        }else if(correct == 1){
            [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button2 layer] setBackgroundColor:[UIColor greenColor].CGColor];
            [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
        }else if(correct == 2){
            [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button3 layer] setBackgroundColor:[UIColor greenColor].CGColor];
            [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
        }else{
            [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
            [[button4 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        }
        button1.enabled = NO;
        button2.enabled = NO;
        button3.enabled = NO;
        button4.enabled = NO;
        
        imageField.hidden = YES;
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
    if(gameCount < 10){
        [self setQuestion];
        [self setButtons];
        
        timeCount = 10;
//    [UIView beginAnimations: nil context: nil];
//    [UIView setAnimationDuration:0.50];
    
        time.text = [NSString stringWithFormat:@"Remain Time: %d", timeCount];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        
//    [UIView commitAnimations];
        button1.enabled = YES;
        button2.enabled = YES;
        button3.enabled = YES;
        button4.enabled = YES;
    }else{
        score = (score*100)/500;
        NSLog(@"Your Score is: %d", score);
        
        UIAlertController *controller = [UIAlertController alertControllerWithTitle: @"Your Score:"
                                                                            message: [NSString stringWithFormat:@"%d", score]
                                                                     preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle: @"OK"
                                                              style: UIAlertActionStyleDestructive
                                                            handler: ^(UIAlertAction *action) {
                                                                NSLog(@"OK button tapped!");
                                                            }];
        [controller addAction: alertAction];
        
        [self presentViewController: controller animated: YES completion: nil];
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

-(IBAction)button1action:(id)sender{
    [timer invalidate];
    scoreTime = timeCount;
    imageField.hidden = YES;
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    if(correct == 0){
        [[button1 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
        
        score = score+scoreTime+40;
    }else if(correct == 1){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else if(correct == 2){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else{
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor greenColor].CGColor];
    }
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;
    
    if(correct == 0){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
    
    
}

-(IBAction)button2action:(id)sender{
    [timer invalidate];
    scoreTime = timeCount;
    
    imageField.hidden = YES;
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    if(correct == 0){
        [[button1 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else if(correct == 1){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
        
        score = score+scoreTime+40;
    }else if(correct == 2){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else{
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor greenColor].CGColor];
    }
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;

    if(correct == 1){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
}

-(IBAction)button3action:(id)sender{
    [timer invalidate];
    scoreTime = timeCount;
    
    imageField.hidden = YES;
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    if(correct == 0){
        [[button1 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else if(correct == 1){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else if(correct == 2){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
        
        score = score+scoreTime+40;
    }else{
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor greenColor].CGColor];
    }
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;

    if(correct == 2){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
}

-(IBAction)button4action:(id)sender{
    [timer invalidate];
    scoreTime = timeCount;
    
    imageField.hidden = YES;
    if(gameCount+1 < 10){
        next.hidden = NO;
        next.enabled = YES;
    }else{
        finish.hidden = NO;
        finish.enabled = YES;
    }
    
    if(correct == 0){
        [[button1 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else if(correct == 1){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else if(correct == 2){
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor redColor].CGColor];
    }else{
        [[button1 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button2 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button3 layer] setBackgroundColor:[UIColor redColor].CGColor];
        [[button4 layer] setBackgroundColor:[UIColor greenColor].CGColor];
        
        score = score+scoreTime+40;
    }
    button1.enabled = NO;
    button2.enabled = NO;
    button3.enabled = NO;
    button4.enabled = NO;

    if(correct == 3){
        [question setText:@"Correct Answer! Congratulations!"];
        [question setTextColor:[UIColor greenColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }else{
        [question setText:@"Sorry, it is wrong."];
        [question setTextColor:[UIColor redColor]];
        [question setFont:[UIFont boldSystemFontOfSize:18]];
    }
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
