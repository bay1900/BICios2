//
//  exchangeViewController.h
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface exchangeViewController : UIViewController


//@property (strong, nonatomic) IBOutlet UITextField *name;
//@property (strong, nonatomic) IBOutlet UITextField *age;

@property (strong, nonatomic) IBOutlet UITextField *exchangeTopTF;
@property (strong, nonatomic) IBOutlet UITextField *exchangeBottomTF;


- (IBAction)openHTML:(id)sender;


//- (IBAction)btnOpenHTML:(id)sender;


@end

NS_ASSUME_NONNULL_END
