//
//  mainViewController.h
//  BIC
//
//  Created by phongpadid on 4/18/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface mainViewController : UIViewController {
    
 //  IBOutlet UIView *transV;
   //IBOutlet UIView *sidePanel;
   //IBOutlet UIButton *menuBtn;
    
    
}

@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet UIView *transV;
@property (weak, nonatomic) IBOutlet UIView *sidePanel;

- (IBAction)menuBtnn:(UIButton *)sender;


// side buttons 
- (IBAction)accelerateButton:(id)sender;

- (IBAction)logoutButton:(id)sender;


@end

NS_ASSUME_NONNULL_END
