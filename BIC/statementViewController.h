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
     UIDatePicker *datePickerUntil ;
     UIDatePicker *datePickerFuture ;
     NSArray *_pickerData;
}
@property (strong, nonatomic) IBOutlet UITextField *dateSelectionTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateSelectedTextFieldUntil;

@property (strong, nonatomic ) NSString* timestamp;
@property (strong, nonatomic ) NSString* date;


@property (strong, nonatomic ) NSString* startStatement;
@property (strong, nonatomic ) NSString* endStatement;

- (IBAction)statementButton:(id)sender;

//
@property (strong, nonatomic) IBOutlet UIButton *setPickUpDate;
- (IBAction)setPickUpDate:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *addPickUpDateTF;


@end

NS_ASSUME_NONNULL_END
