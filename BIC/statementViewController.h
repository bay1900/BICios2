//
//  statementViewController.h
//  BIC
//
//  Created by phongpadid on 6/10/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface statementViewController : UIViewController {
     UIDatePicker *datePicker;
     NSArray *_pickerData;
}
@property (strong, nonatomic) IBOutlet UITextField *dateSelectionTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateSelectedTextFieldUntil;

- (IBAction)statementButton:(id)sender;
@end

NS_ASSUME_NONNULL_END
