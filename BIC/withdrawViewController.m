//
//  withdrawViewController.m
//  BIC
//
//  Created by phongpadid on 6/13/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "withdrawViewController.h"

@interface withdrawViewController ()

@end

@implementation withdrawViewController
@synthesize hundred, fifty, twenty, ten, five, fiftyCent, twentyCent, tenCent, total;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //
    datePickerFuture =  [[ UIDatePicker alloc ] init ];
    datePickerFuture.datePickerMode = UIDatePickerModeDate;
    [ self.futurePickupTF setInputView: datePickerFuture ];

    // call TOOLBAR
    [self theToolBarFuture ];
    
     self.hundred.delegate = self;
     self.fifty.delegate = self;
     self.twenty.delegate = self;
     self.ten.delegate = self;
     self.five.delegate = self;
     self.fiftyCent.delegate = self;
     self.twentyCent.delegate = self;
     self.tenCent.delegate = self;
    
    
    //didMisss keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [hundred resignFirstResponder];
    [fifty resignFirstResponder];
    [twenty resignFirstResponder];
    [ten resignFirstResponder];
    [five resignFirstResponder];
    [fiftyCent resignFirstResponder];
    [twentyCent resignFirstResponder];
    [tenCent resignFirstResponder];
    
    [ self calculateTotal ]; 
    return YES;
}




-(void)viewWillAppear:(BOOL)animated {
    
    [ self checkEmpty ];
    
    NSLog( @"viewWillAppear ");
    
}

-(void ) checkEmpty {
    
    if ( hundred.text.length > 0 ) {
        [ self calculateTotal ];
    }
}




-(void)calculateTotal {

    double hundredNum = [ hundred.text doubleValue ];
    double fiftyNum   = [fifty.text doubleValue] ;
    double twentyNum  = [twenty.text doubleValue] ;
    double tenNum     = [ten.text doubleValue] ;
    double fiveNum   = [five.text doubleValue] ;
    double fiftyCentNum   = [fiftyCent.text doubleValue] ;
    double twentyCentNum  = [twentyCent.text doubleValue] ;
    double tenCentNum     = [tenCent.text doubleValue] ;
    
   // FORMULAR
    double getTotal = ( hundredNum * 100 ) + ( fiftyNum * 50) + ( twentyNum * 20 ) + ( tenNum * 10 ) + ( fiveNum * 5 ) + ( fiftyCentNum * 0.5 ) + ( twentyCentNum * 0.2 ) + ( tenCentNum * 0.1);
    NSNumber *getTotalNum = [ NSNumber numberWithDouble: getTotal ] ;
   // NSLog( @"TOTAL: %f ", total );
    
    total.text = [getTotalNum stringValue ];
}


- (IBAction)setFuturePickupDate:(id)sender {
    
    if ( _futurePickupTF.hidden == YES  ) {
                    _futurePickupTF.hidden = NO;
                    _futurePickupTF.text = @"";
                    [ _setFuturePickupDate setTitle: @"-" forState: UIControlStateNormal ];
    }
    else if ( _futurePickupTF.hidden == NO ) {
                    _futurePickupTF.hidden = YES;
                    [_setFuturePickupDate setTitle: @"+" forState: UIControlStateNormal ];
        
    }[self calculateTotal ];
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    [ self calculateTotal ]; 
}

-(void)dismissKeyboard {
    
    // dismiss key board when tap screen
     [hundred resignFirstResponder];
     [fifty resignFirstResponder];
     [twenty resignFirstResponder];
     [ten resignFirstResponder];
     [five resignFirstResponder];
     [fiftyCent resignFirstResponder];
     [twentyCent resignFirstResponder];
     [tenCent resignFirstResponder];
}


-(void)ShowSelectedDateFuture{
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"dd-MM-yyyy"];
    self.futurePickupTF.text = [ NSString stringWithFormat: @"%@", [ formatter stringFromDate:datePickerFuture.date ]];
    [self.futurePickupTF resignFirstResponder ];
    
    
    
}

-(void)theToolBarFuture {
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDateFuture)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.futurePickupTF setInputAccessoryView:toolBar];
    
}

@end
