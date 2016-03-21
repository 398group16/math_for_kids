//
//  RootViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-25.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    IBOutlet UIButton* signB;
    
    NSMutableArray* userAccounts;
    IBOutlet UICollectionView* user_col;
}


//-(IBAction)imageToHomeView:(id)sender;


@end
