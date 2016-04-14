//
//  addCells.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-21.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addCells : UICollectionViewCell{
    IBOutlet UIImageView* add_img;
    IBOutlet UILabel* title;
}
-(void)loadCellTitle:(NSString*)newTitle;
-(void)loadCellImg:(NSString*)newImg;

@end
