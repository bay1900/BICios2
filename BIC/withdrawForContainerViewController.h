//
//  withdrawForContainerViewController.h
//  BIC
//
//  Created by phongpadid on 6/13/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface withdrawForContainerViewController : UIViewController

@property (nonatomic, strong ) NSDictionary *dictData;

@property (strong, nonatomic) NSString *buttonLinkPDF;


// firebase databse
// firebase database reference
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

NS_ASSUME_NONNULL_END
