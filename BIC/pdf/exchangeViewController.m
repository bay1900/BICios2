//
//  exchangeViewController.m
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeViewController.h"
#import "exchangeWebviewViewController.h"

// currency object


@interface exchangeViewController ()

@end

@implementation exchangeViewController


@synthesize exchangeTopTF, exchangeBottomTF, storeData;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ self fetchData ] ;
    

    
                    // No interaction of "Textfield botton"
                    [ self.exchangeBottomTF setUserInteractionEnabled:  NO ];
    
                    // origin
                    self.tableViewO.delegate = self;
                    self.tableViewO.dataSource = self ;
    
                    //set all tableview hidden when page is loaded
                    if ( self.tableViewO.hidden == YES ) {
                        [ self.tableViewO setHidden: NO ];
                    }
                    else
                        [ self.tableViewO setHidden: YES ];
    
                    // covert
    
                    self.tableviewCovert.delegate = self;
                    self.tableviewCovert.dataSource = self;
    
                    //set all tableview hidden when page is loaded
                    if ( self.tableviewCovert.hidden == YES ) {
                        [ self.tableviewCovert setHidden: NO ];
                    }
                    else
                        [ self.tableviewCovert setHidden: YES ];
    
    ////////
    
    NSMutableArray *myCurrency = [[ NSMutableArray alloc] init ] ;  // store currency name
    NSMutableArray *myValue = [[ NSMutableArray alloc ] init ];     // store values
    
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://data.fixer.io/api/latest?access_key=2056ca64bc11aa6cad1a18a1e191f957&format=1"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: url_string ]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
    
    NSMutableDictionary *j =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
 
    
    for (NSString * key in j[@"rates"]) {
        
                NSString *value = [j[@"rates"] objectForKey:key];
        
                        //NSString *x = value;
                        // NSString *y = key;
        
                [ myCurrency addObject: key ];
                [ myValue addObject: value ];
        
                // treat  NSMutableArray as  NSArray for tableview
                self.cur = [[NSArray alloc] initWithArray: myCurrency];
                self.rate = [[ NSArray alloc ] initWithArray: myValue ];
        
                //NSLog( @"the cur array %@", self.cur );
                // NSLog( @"the rate array %@", self.rate );
        
        
    }
    
    
    
    
    NSLog(  @" key AUD indexOfOBJECT%lu  ::: ", (unsigned long)[ _cur indexOfObject: @"AUD" ] );
   // NSLog(  @" value AUD indexOfOBJECT%lu  ::: ", (unsigned long)[ _rate indexOfObject:  ] );
    
    
  //  NSLog( @">>>>>>>>>>>>  %@", _rate[indexOfCur]);
  

    
    NSLog( @"gg:::::::::::%@", myCurrency );
    NSLog( @"gg:::::::::::%@", myValue );
    
    
    
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    
    // trigger segue if register success
    UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Sidebar" bundle: nil ];
    exchangeWebviewViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"exchangePDF"];
    
    
    
    NSMutableDictionary *dict = [[ NSMutableDictionary alloc ] init ];
    
    [ dict setObject: exchangeTopTF.text forKey:@"nameKey"];
    [ dict setObject: exchangeBottomTF.text forKey:@"ageKey"];
    
    
    //[ dict setObject: @"A" forKey:@"nameKey"];
    //[ dict setObject: @"B" forKey:@"ageKey"];
    
    // pass data `
    vc.dictData = dict;
    
    NSLog (@"nsdic = %@", dict);
    
    // perform animate
    [ self presentViewController: vc animated: YES completion: nil ];
    
    
    
    

}


- (IBAction)openHTML:(id)sender {

    
}

// drop down table view
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    
            static NSString *simpleTableIdentifier = @"SimpleTableItem";
            UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
                        if ( tableView == _tableViewO ) {
                            
                                     cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
                            
                                     cell.textLabel.text = [ self.cur objectAtIndex: indexPath.row];
                                     cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
                                    // return  cell;
                                    NSLog( @"Tableview 1");
                            
                        }
                        else if ( tableView == _tableviewCovert) {
                            
                            
                                     cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
                            
                                     cell.textLabel.text = [ self.cur objectAtIndex: indexPath.row];
                                     cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
                            
                                     NSLog( @"Tableview 2");
                            
                        }
                        else {
                            
                             NSLog( @"Tableview error");
                        }
    
           return cell ;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
                    if ( tableView == _tableViewO) {
                        return [ self.cur count] ;
                    }
                    else if (tableView == _tableviewCovert) {
                        return  [ self.cur count ];
                    }
                    else
                        NSLog( @"No data return for tableview row ");
    
                    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
                    if ( tableView == _tableViewO ) {
                        
                                // get the value of tableview index selected
                                UITableViewCell *cell = [ self.tableViewO cellForRowAtIndexPath: indexPath ];
                        
                                // set button text as tableview path value selected
                                [self.btnOutlet setTitle: cell.textLabel.text  forState: UIControlStateNormal ];
                        
                                //hide tableview when cell any cell is clicked
                                self.tableViewO.hidden = YES;
                        
                        
                               self.originSymbol = cell.textLabel.text ;
                               NSLog(  @"Origin amount : %@",  _originSymbol );
                        
                        
                    
                    }
                    else if ( tableView == _tableviewCovert) {
                        
                                // get the value of tableview index selected
                                UITableViewCell *cell = [ self.tableviewCovert cellForRowAtIndexPath: indexPath ];
                        
                                // set button text as tableview path value selected
                                [self.buttonCovert setTitle: cell.textLabel.text  forState: UIControlStateNormal ];
                        
                                //hide tableview when cell any cell is clicked
                                self.tableviewCovert.hidden = YES;
                        
                                self.covertSymbol = cell.textLabel.text ;
                                NSLog(  @"covert amount : %@",  _covertSymbol );
                        
                        
                        
                    }
                    else {
                        
                                NSLog( @"Something went wrong on didSelectRowAtIndexPath ");
                    }
  
    [ self covertMethod ]; 
    
}



// Origin currency button
- (IBAction)btnAction:(id)sender {
    
                        // set hidden
                            if ( self.tableViewO.hidden == YES ) {
                                [ self.tableViewO setHidden: NO ];
                            }
                            else
                                [ self.tableViewO setHidden: YES ];

    
}





// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


// Covert currency button
- (IBAction)covertButton:(id)sender {
    

                    //set hidden
                    if ( self.tableviewCovert.hidden == YES ) {
                        [ self.tableviewCovert setHidden: NO ];
                    }
                    else
                        [ self.tableviewCovert setHidden: YES ];
    
                    // double originCurrency = [ exchangeTopTF.text doubleValue ];
    

}


- (IBAction)buttonCovert:(id)sender {
}


- (void)fetchData {
    NSString *userAuth = [FIRAuth auth].currentUser.uid;
    
    NSLog( @"This is the userAuth in fetch data fuction: %@", userAuth );
    
    self.ref = [[FIRDatabase database] reference];
    
    [[[[[self.ref child: @"client"]child: userAuth ] child: @"account"] child: @"balance" ] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        
        NSMutableDictionary *usersDict =  [[ NSMutableDictionary alloc ] init ];
        
        [ usersDict setObject: snapshot.value  forKey: @"the snap"];
        
        NSString *snapshotValue = [ usersDict objectForKey:  @"the snap"];
        NSLog(@"snapshot vlaue : %@",snapshotValue);
        
        NSLog(@"Information : %@",usersDict);
    }];
    
    
    NSLog( @" fetching data from firebase ");
}


-(void) fetchLoopKey {
    
    
    NSString *userAuth = [FIRAuth auth].currentUser.uid;
    
    
    FIRDatabaseQuery *myTopPostsQuery = [[self.ref child:@"client"] queryOrderedByKey];
    
    storeData = [[ NSMutableArray alloc ] init ];
    
    [ myTopPostsQuery observeEventType: FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        BOOL isStuff = [ snapshot key ];
        
        
        exData *ex = [[ exData alloc ] init ] ;
        NSLog( @":::::::::::::::::::::%@", snapshot.key);
        NSLog( @":::::::::::::::::::::%d", isStuff);
        
        
    }];

    
}

- (IBAction)theCovert:(id)sender {
    
    
    float inputTop =  [ exchangeTopTF.text floatValue ];

    // Origin and covert button symbol
    NSString *x = _buttonCovert.titleLabel.text;
    NSString *y =  _btnOutlet.titleLabel.text;
    
  
}

-(void)covertMethod{
    
    NSInteger inputTop =  [ exchangeTopTF.text integerValue ];
    
    NSLog( @"the originSymbol %ld", (long)inputTop );

    
    NSLog( @"the originSymbol %@", _originSymbol );
    NSLog( @"the covertSymbol %@", _covertSymbol );
    
    
    if ( ![self.originSymbol  isEqual: @"CURRENCY"] ) {
        
                // calculate result
                // check indexofObject of the string in an array
               NSInteger *indexCurr =  [self.cur indexOfObject: _originSymbol];
                int indexCur = (int) indexCurr;   // treat NSInteger as int
               NSLog( @"Index of cur button %lu",  (unsigned long)indexCurr);
        
        
                // Check rate base on indexCure
                NSString *valueRateee =  self.rate[indexCur];
               // NSInteger *valueRatee = [ valueRatee integerValue ];
                int valueRate = [ valueRateee  integerValue ];
                NSLog( @"the result of selected index:::: %@ ", valueRateee );
        
                // covert origin rate to uero because, data that fetch from FIXER.IO base on UERO rates
                 self.originToUERO = inputTop * valueRate ;
        
        
                // set botton textfield as the result of the exchange
        self.exchangeBottomTF.text =  [ NSString stringWithFormat: @"%lu", (unsigned long)self.originToUERO ] ;
        
        
    } else if ( ![self.covertSymbol  isEqual: @"CURRENCY"]  ) {
        
    }
    else {
        
    }

}


@end
