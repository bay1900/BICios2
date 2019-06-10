//
//  LandingPageViewController.h
//  BIC
//
//  Created by phongpadid on 4/11/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;


NS_ASSUME_NONNULL_BEGIN

@interface LandingPageViewController : UIViewController
- (IBAction)registerLand:(id)sender;
- (IBAction)loginLand:(id)sender;




@property (strong, nonatomic ) NSArray* cur;
@property (strong, nonatomic ) NSArray* rate;

@property (nonatomic, assign) int theIndex;



@end

NS_ASSUME_NONNULL_END
