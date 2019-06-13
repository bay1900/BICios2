//
//  statementViewController.m
//  BIC
//
//  Created by phongpadid on 6/10/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//





#import "statementViewController.h"
#import "statementWebviewViewController.h"
#import "statementForContainerViewController.h"

@interface statementViewController ()

@end

@implementation statementViewController
@synthesize  startStatement, endStatement, timestamp, date ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    datePicker =  [[ UIDatePicker alloc ] init ];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [ self.dateSelectionTextField setInputView: datePicker ];

    
   // call TOOLBAR
    [self theToolBar ];
    
    // SET HIDDEN 
    self.dateSelectedTextFieldUntil.userInteractionEnabled =  NO ;
    

   }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    statementForContainerViewController *x ;
    x = [ segue destinationViewController];
    

    // store data from textfields in dictionary
    NSMutableDictionary *dict = [[ NSMutableDictionary alloc ] init ];
    
        [ dict setObject: @"3 Bldg A Mueang Canthabuli" forKey:@"address"];
        [ dict setObject: @"Vientiane, Laos" forKey:@"country"];
        [ dict setObject: @"+856 21 211 018" forKey:@"phone"];
        [ dict setObject: date forKey:@"date"];
        [ dict setObject: timestamp forKey:@"billNumber"];
    
        [ dict setObject: timestamp forKey:@"timestamp"];

         [ dict setObject: self.dateSelectionTextField.text forKey:@"startStatement"];
         [ dict setObject: self.dateSelectedTextFieldUntil.text forKey:@"endStatement"];
         [ dict setObject: self.addPickUpDateTF.text forKey:@"futurepickup"];

    // pass data
    x.dictData = dict;
    
    NSLog (@"nsdic = %@", dict);
  
}




-(void)ShowSelectedDate{
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"dd-MM-yyyy"];
    self.dateSelectionTextField.text = [ NSString stringWithFormat: @"%@", [ formatter stringFromDate:datePicker.date ]];
    [self.dateSelectionTextField resignFirstResponder ];
    
    //
    self.dateSelectedTextFieldUntil.userInteractionEnabled =  YES ;
}

-(void)theToolBar {
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.dateSelectionTextField setInputAccessoryView:toolBar];
    
    //  /
    datePickerUntil =  [[ UIDatePicker alloc ] init ];
    datePickerUntil.datePickerMode = UIDatePickerModeDate;
    [ self.dateSelectedTextFieldUntil setInputView: datePickerUntil ];
    
    
    // call TOOLBAR
    [self theToolBarUntil ];

    
}


-(void)ShowSelectedDateUntil{
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"dd-MM-yyyy"];
    self.dateSelectedTextFieldUntil.text = [ NSString stringWithFormat: @"%@", [ formatter stringFromDate:datePickerUntil.date ]];
    [self.dateSelectedTextFieldUntil resignFirstResponder ];
    
    
    //
    self.dateSelectedTextFieldUntil.userInteractionEnabled =  YES ;
    
    // GET DATE
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"d.M.yyyy";
    date  = [dateFormat stringFromDate:[NSDate date]];
    
    NSLog( @"date date date %@", date );
    
    //GET TIMESTAMP
    NSInteger  timestampLong = [[NSDate date] timeIntervalSince1970]; // snap timstamp when covert method is called
    NSLog( @" The timestampe value ::: %ld", (long)timestampLong );
    timestamp =  [ NSString stringWithFormat: @"%ld", (long)timestampLong];
    
}

-(void)theToolBarUntil {
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDateUntil)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.dateSelectedTextFieldUntil setInputAccessoryView:toolBar];
    
    
    //
    datePickerFuture =  [[ UIDatePicker alloc ] init ];
    datePickerFuture.datePickerMode = UIDatePickerModeDate;
    [ self.addPickUpDateTF setInputView: datePickerFuture ];
    
    
    // call TOOLBAR
    [self theToolBarFuture ];
    
    
    // 
    
}

-(void)ShowSelectedDateFuture{
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"dd-MM-yyyy"];
    self.addPickUpDateTF.text = [ NSString stringWithFormat: @"%@", [ formatter stringFromDate:datePickerFuture.date ]];
    [self.addPickUpDateTF resignFirstResponder ];
    

    
}

-(void)theToolBarFuture {
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDateFuture)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.addPickUpDateTF setInputAccessoryView:toolBar];
    
}

- (IBAction)statementButton:(id)sender {
    
    NSLog( @"a %@ ", self.dateSelectionTextField.text );
    NSLog( @"b %@ ", self.dateSelectedTextFieldUntil.text );


}


-(void)viewWillAppear:(BOOL)animated {
    
    NSLog( @"viewWillAppear is loaded ");
    
    date;
    timestamp;
    
}
- (IBAction)setPickUpDate:(id)sender {
    
    
    if ( _addPickUpDateTF.hidden == YES  ) {
        _addPickUpDateTF.hidden = NO;
        [ _setPickUpDate setTitle: @"-" forState: UIControlStateNormal ];
    }
    else if ( _addPickUpDateTF.hidden == NO ) {
        _addPickUpDateTF.hidden = YES;
        [_setPickUpDate setTitle: @"+" forState: UIControlStateNormal ];
        
    }
}
@end
