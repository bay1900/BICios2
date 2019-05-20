//
//  exchangeForContainerViewController.h
//  BIC
//
//  Created by phongpadid on 5/15/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface exchangeForContainerViewController : UIViewController

//@property (nonatomic, strong ) NSDictionary *dictData;



// no need
@property (nonatomic, assign) BOOL isSomethingEnabled;
@property (strong, nonatomic) NSString *theData;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

// Try .. delete it later
@property (nonatomic, strong ) NSDictionary *tryData;

@end

NS_ASSUME_NONNULL_END
