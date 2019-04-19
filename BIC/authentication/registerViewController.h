//
//  registerViewController.h
//  BIC
//
//  Created by phongpadid on 4/4/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface registerViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *registerEmail;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;


- (IBAction)registerButton:(id)sender;


- (IBAction)logoutButton:(UIButton *)sender;

-(void)printIT;

@end

NS_ASSUME_NONNULL_END
