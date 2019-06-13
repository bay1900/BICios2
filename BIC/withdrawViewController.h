//
//  withdrawViewController.h
//  BIC
//
//  Created by phongpadid on 6/13/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface withdrawViewController : UIViewController <UITextFieldDelegate> {
         UIDatePicker *datePickerFuture ;
}


// ALL TEXTFIELDS
@property (strong, nonatomic) IBOutlet UITextField *hundred;
@property (strong, nonatomic) IBOutlet UITextField *fifty;
@property (strong, nonatomic) IBOutlet UITextField *twenty;
@property (strong, nonatomic) IBOutlet UITextField *ten;
@property (strong, nonatomic) IBOutlet UITextField *five;
@property (strong, nonatomic) IBOutlet UITextField *fiftyCent;
@property (strong, nonatomic) IBOutlet UITextField *twentyCent;
@property (strong, nonatomic) IBOutlet UITextField *tenCent;
@property (strong, nonatomic) IBOutlet UITextField *total;


@property (strong, nonatomic) IBOutlet UIButton *requestWithdraw;

@property (strong, nonatomic) IBOutlet UITextField *futurePickupTF;
@property (strong, nonatomic) IBOutlet UIButton *setFuturePickupDate;
- (IBAction)setFuturePickupDate:(id)sender;

//

@end

NS_ASSUME_NONNULL_END
