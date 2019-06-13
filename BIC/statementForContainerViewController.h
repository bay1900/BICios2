//
//  statementForContainerViewController.h
//  BIC
//
//  Created by phongpadid on 6/11/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface statementForContainerViewController : UIViewController 
@property (nonatomic, strong ) NSDictionary *dictData;


// firebase databse
// firebase database reference
@property (strong, nonatomic) FIRDatabaseReference *ref;

@property (strong, nonatomic) NSString *buttonLinkPDF;


@end

NS_ASSUME_NONNULL_END
