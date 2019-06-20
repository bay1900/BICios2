//
//  withdrawViewController.m
//  BIC
//
//  Created by phongpadid on 6/13/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "withdrawViewController.h"
#import "withdrawForContainerViewController.h"


@interface withdrawViewController ()

@end

@implementation withdrawViewController
@synthesize hundred, fifty, twenty, ten, five, fiftyCent, twentyCent, tenCent, total, date, timestamp ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // SET PICK UP DATE HIDDEN WHEN SENCE FIRST LOAD
     _futurePickupTF.hidden = YES ;
    
    // DATE PICKER
    datePickerFuture =  [[ UIDatePicker alloc ] init ];
    datePickerFuture.datePickerMode = UIDatePickerModeDate;
    [ self.futurePickupTF setInputView: datePickerFuture ];

    // call TOOLBAR
    [self theToolBarFuture ];
    
     // 
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


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    withdrawForContainerViewController *x ;
    x = [ segue destinationViewController];
    
    
    // store data from textfields in dictionary
    NSMutableDictionary *dict = [[ NSMutableDictionary alloc ] init ];
    
    [ dict setObject: @"3 Bldg A Mueang Canthabuli" forKey:@"address"];
    [ dict setObject: @"Vientiane, Laos" forKey:@"country"];
    [ dict setObject: @"+856 21 211 018" forKey:@"phone"];
    
    [ dict setObject: date forKey:@"date"];
    [ dict setObject: timestamp forKey:@"billNumber"];
    [ dict setObject: timestamp forKey:@"timestamp"];
    [ dict setObject: self.futurePickupTF.text forKey:@"futurepickup"];
    
    [ dict setObject: hundred.text forKey:@"hundred"];
    [ dict setObject: fifty.text forKey:@"fifty"];
 
    [ dict setObject: twenty.text forKey:@"twenty"];
    [ dict setObject: ten.text forKey:@"ten"];
    [ dict setObject: five.text forKey:@"five"];
    [ dict setObject: fiftyCent.text forKey:@"hasipCent"];
    [ dict setObject: twentyCent.text forKey:@"saoCent"];
    [ dict setObject: tenCent.text forKey:@"zipCent"];
    
    [ dict setObject: total.text forKey:@"total"];

    
    // pass data
    x.dictData = dict;
    
    NSLog (@"nsdic = %@", dict);
}




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
    
  
    
    NSLog( @"viewWillAppear ");
    
}



-(void)calculateTotal {
    
    
    // GET DATE
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"d.M.yyyy";
    date  = [dateFormat stringFromDate:[NSDate date]];
    
    NSLog( @"date date date %@", date );
    
    //GET TIMESTAMP
    NSInteger  timestampLong = [[NSDate date] timeIntervalSince1970]; // snap timstamp when covert method is called
    NSLog( @" The timestampe value ::: %ld", (long)timestampLong );
    timestamp =  [ NSString stringWithFormat: @"%ld", (long)timestampLong];

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
