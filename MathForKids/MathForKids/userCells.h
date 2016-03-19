//
//  userCells.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-19.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userCells : UICollectionViewCell{
    IBOutlet UIButton* user_img;
    IBOutlet UILabel* user_name;
}

-(void)loadCellLabel:(NSString*)newName;
-(void)loadCellButton:(NSString*)newImg;

@end
