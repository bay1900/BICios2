//
//  exchangeViewController.h
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase; //  firebase class connection

// data model
#import "exData.h"

// currency


NS_ASSUME_NONNULL_BEGIN

@interface exchangeViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>


//@property (strong, nonatomic) IBOutlet UITextField *name;
//@property (strong, nonatomic) IBOutlet UITextField *age;

// Textfield
    @property (strong, nonatomic) IBOutlet UITextField *exchangeTopTF;
    @property (strong, nonatomic) IBOutlet UITextField *exchangeBottomTF;


//Request PDF button
    - (IBAction)openHTML:(id)sender;


// origin currency properties
    @property (weak, nonatomic) IBOutlet UIButton *btnOutlet;
    @property (strong, nonatomic) IBOutlet UITableView *tableViewO;
    @property (strong, nonatomic) NSArray *data;

    - (IBAction)btnAction:(id)sender;

// covert currency properties
    @property (strong, nonatomic) IBOutlet UIButton *buttonCovert;
    @property (strong, nonatomic) IBOutlet UITableView *tableviewCovert;
    @property (strong, nonatomic ) NSArray* dataCovert;
    - (IBAction)buttonCovert:(id)sender;




@property (strong, nonatomic) IBOutlet UILabel *internetReponse;



@property (strong, nonatomic) FIRDatabaseReference *ref;




@property (strong, nonatomic) NSMutableArray *storeData;

- (IBAction)theCovert:(id)sender;


@property (strong, nonatomic ) NSString* originSymbol;
@property (strong, nonatomic ) NSString* covertSymbol;

///
@property (strong, nonatomic ) NSArray* cur;
@property (strong, nonatomic ) NSArray* rate;

/////
@property (nonatomic)  double* originToUERO;
@property (nonatomic)  double* result;



@property (nonatomic, assign) int theIndex;



@end

NS_ASSUME_NONNULL_END
