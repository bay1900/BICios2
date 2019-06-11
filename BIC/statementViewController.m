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
   
    
    // pass data
    x.dictData = dict;
    
    NSLog (@"nsdic = %@", dict);
  
}




-(void)ShowSelectedDate{
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"dd-mm-yy"];
    self.dateSelectionTextField.text = [ NSString stringWithFormat: @"%@", [ formatter stringFromDate:datePicker.date ]];
    [self.dateSelectionTextField resignFirstResponder ];
    

    //
    self.dateSelectedTextFieldUntil.userInteractionEnabled =  YES ;
    
    if ( self.dateSelectedTextFieldUntil.userInteractionEnabled == YES ) {
        
                datePicker =  [[ UIDatePicker alloc ] init ];
                datePicker.datePickerMode = UIDatePickerModeDate;
                [ self.dateSelectedTextFieldUntil setInputView: datePicker ];
                [self theToolBarUntil ];
        
    }

}

-(void)ShowSelectedDateUntil{
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"dd/mm/yy"];
    self.dateSelectedTextFieldUntil.text = [ NSString stringWithFormat: @"%@", [ formatter stringFromDate:datePicker.date ]];
    [self.dateSelectedTextFieldUntil resignFirstResponder ];
    
}


-(void)theToolBar {
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.dateSelectionTextField setInputAccessoryView:toolBar];
    
}

-(void)theToolBarUntil {
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDateUntil)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.dateSelectedTextFieldUntil setInputAccessoryView:toolBar];
    
}





- (IBAction)statementButton:(id)sender {
    
    NSLog( @"a %@ ", self.dateSelectionTextField.text );
    NSLog( @"b %@ ", self.dateSelectedTextFieldUntil.text );

}
@end
