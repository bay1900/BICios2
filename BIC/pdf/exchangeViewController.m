//
//  exchangeViewController.m
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeViewController.h"
#import  "exchangeForContainerViewController.h"
#import "exchangeWebviewViewController.h"


// currency object


@interface exchangeViewController ()

@end

@implementation exchangeViewController


@synthesize exchangeTopTF, exchangeBottomTF, storeData, cur, rate, originToUERO, indexCur, jCount, j, resultCovertEndpoint ;


- (void)viewDidLoad {
    [super viewDidLoad];

    // user press keyboard return "hide keyboard"
    self.exchangeTopTF.delegate = self;
    
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
    
 

    
    // Retreive latest rate from fixer.io
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://data.fixer.io/api/latest?access_key=2056ca64bc11aa6cad1a18a1e191f957&base=AUD&symbols=USD,EUR,GBP,INR,CAD,SGD,CHF,MYR,JPY,CNY,THB"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: url_string ]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
    
    NSMutableDictionary *j =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
    
    NSLog( @"the j ::: %@", j );
    NSLog( @"the j[rates] ::: %@", j[@"rates"] );
    NSLog( @"the j[rates]  count ::: %lu", (unsigned long)[j[@"rates"] count]);

   
    //  Array
    NSMutableArray *myCurrency = [[ NSMutableArray alloc] init ] ;  // store currency name
    NSMutableArray *myValue = [[ NSMutableArray alloc ] init ];     // store values
    
    // copy currency rate and name in new arrays
    for (NSString * key in j[@"rates"]) {

        NSString *value = [j[@"rates"] objectForKey:key];

        [ myCurrency addObject: key ];
        [ myValue addObject: value ];

        // treat  NSMutableArray as  NSArray for tableview
        self.cur = [[NSArray alloc] initWithArray: myCurrency];
        self.rate = [[ NSArray alloc ] initWithArray: myValue ];

    }


    
    
   // NSLog(  @" key AUD indexOfOBJECT%lu  ::: ", (unsigned long)[ cur indexOfObject: @"AUD" ] );
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
    
    
   // NSString *jj = self.dateReceipt;
    

    // pass data from exchangeVC to exchangeForContainerVC
    // allocate
    exchangeForContainerViewController *x ;
    x = [ segue destinationViewController];
    
    // store data from textfields in dictionary
    NSMutableDictionary *dict = [[ NSMutableDictionary alloc ] init ];
    [ dict setObject: exchangeTopTF.text forKey:@"fcAmount"];
    [ dict setObject: exchangeBottomTF.text forKey:@"lcAmount"];
    
    [ dict setObject: @"3 Bldg A Mueang Canthabuli" forKey:@"address"];
    [ dict setObject: @"Vientiane, Laos" forKey:@"country"];
    [ dict setObject: @"+856 21 211 018" forKey:@"phone"];
    [ dict setObject: self.dateReceipt forKey:@"date"];
    [ dict setObject: self.billNumber forKey:@"billNumber"];
    
    [ dict setObject: self.rateReceipt forKey:@"exchangeRate"];
    [ dict setObject: self.originSymbol forKey:@"origin"];
    [ dict setObject: self.covertSymbol forKey:@"covert"];
  
    
    // pass data
    x.dictData = dict;

    NSLog (@"nsdic = %@", dict);
    NSString *name = @"bay";
    
    x.theData = name ;
    

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
        
    }
    else if ( tableView == _tableviewCovert) {
        
            cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
            cell.textLabel.text = [ self.cur objectAtIndex: indexPath.row];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
    }
    else {
        
        NSLog( @"[ERROR] Tableview cellForRowAtIndexPath error");
    }
    
    return cell ;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

            if ( tableView == _tableViewO) {
                return [self.cur count] ;
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
                
                // Trigger fixerCovert when user click button bottom
                [ self fixerCovert ];
                [ self viewWillAppear: true ];   // update result in textfield bottom

                
            }
            else {
                
                        NSLog( @"[ERROR] Something went wrong on didSelectRowAtIndexPath ");
            }
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
    
    // authenticated user
    NSString *userAuth = [FIRAuth auth].currentUser.uid;
    
    // display the authenticated user ID
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
    
//
//    NSString *userAuth = [FIRAuth auth].currentUser.uid;
//
//
//    FIRDatabaseQuery *myTopPostsQuery = [[self.ref child:@"client"] queryOrderedByKey];
//
//    storeData = [[ NSMutableArray alloc ] init ];
//
//    [ myTopPostsQuery observeEventType: FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//
//        BOOL isStuff = [ snapshot key ];
//
//
//        exData *ex = [[ exData alloc ] init ] ;
//        NSLog( @":::::::::::::::::::::%@", snapshot.key);
//        NSLog( @":::::::::::::::::::::%d", isStuff);
//
//
//    }];

    
}

- (IBAction)theCovert:(id)sender {
    
    
//    float inputTop =  [ exchangeTopTF.text floatValue ];
//
//    // Origin and covert button symbol
//    NSString *x = _buttonCovert.titleLabel.text;
//    NSString *y =  _btnOutlet.titleLabel.text;
//
//
}

-(void)covertMethod{
//
//    int inputTop =  (int)[ exchangeTopTF.text integerValue ];
//
//    NSLog( @"the originSymbol %d", inputTop );
//
//
//    NSLog( @"the originSymbol %@", _originSymbol );
//    NSLog( @"the covertSymbol %@", _covertSymbol );
//
//
//    if ( ![self.originSymbol  isEqual: @"CURRENCY"] ) {
//
//
//
//
//    } else if ( ![self.covertSymbol  isEqual: @"CURRENCY"] ) {
//
//
//
//    }
//    else {
//
//    }

}


-(void)covertOrigin  {
    
    int inputOriginTF =  (int)[ exchangeTopTF.text integerValue ];

    // check indexofObject of the string in an array
    indexCur =  (int)[cur indexOfObject: _originSymbol];
    NSLog( @"Index of original  ::::: %d", indexCur);
    
    
    // Check rate base on indexCure
    NSString *valueRateee =  self.rate[indexCur];
    
    // --------------------------------
    
    double valueRate = (double)[ valueRateee  doubleValue ];
    NSLog( @"Rate of origin ::::: %@ ", valueRateee );
    
    // covert origin rate to uero because, data that fetch from FIXER.IO base on UERO rates
    
    double fcAmount ;
    fcAmount  = inputOriginTF * valueRate ;
    
    originToUERO  = fcAmount ;
    
    NSLog( @"originToUERO ::::: %.2f", fcAmount  );
    [ self viewWillAppear: true ];
    
    
    

}

- (void)getTotal{
    
    NSLog(  @" %@",   rate[indexCur]);   // todo
    // get the AUS rate fom valueRate array
//    int indexRate ;
//    NSLog( @"Index of rate  ::::: %d", indexRate);
//
    // Check rate base on indexCure
    NSString *rateArray =  rate[indexCur];;
    
    // ----------------------------------
    
    double covertRate = (double)[ rateArray doubleValue];
    NSLog( @"Rate of covert ::::: %@ ", rateArray );
    
    
    _lcAmount =  originToUERO * covertRate ;
    NSLog( @" The covert result ::::: %.2f", _lcAmount  );
    
//    // set botton textfield as the result of the exchange
//    self.exchangeBottomTF.text =  [ NSString stringWithFormat: @"%.2f", lcAmount ];
}

-(void)viewWillAppear:(BOOL)animated {
    
    // set botton textfield as the result of the exchange
    self.exchangeBottomTF.text =  [ NSString stringWithFormat: @"%.2f", resultCovertEndpoint];
    NSLog( @"viewWillAppear is loaded ");
    
    //
    _dateReceipt;
    _billNumber;
    _rateReceipt;
    
    NSLog ( @"%@", _dateReceipt );
    NSLog ( @"%@", _billNumber );
    NSLog ( @"%@", _rateReceipt );

}

- (IBAction)exchangeReguest:(id)sender {
    
    NSLog( @" Exchange button is clicked !");

    // perform segue base on segue identifier
    [ self performSegueWithIdentifier: @"toVC" sender: self ]; 
    
}



-(void)fixerCovert {
    
        NSError *error;
        NSString *x = self.originSymbol ;          // origin 
        NSString *y = self.covertSymbol;           // covert
        NSString *z = self.exchangeTopTF.text;     // amount
    
        // custom fixer.link
        // retreive fixer.io covert endpoint
        NSString *covertURL = [ NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=%@&to=%@&amount=%@", x, y, z ];
        NSLog(@" +++++++ %@", covertURL);
    
        NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: covertURL ]];
        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error ];
    
       
        NSMutableDictionary *covertEndpoint =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
    
        NSLog( @"date ::: %@", covertEndpoint[@"date"]);
        NSLog( @"query ::: %@", covertEndpoint[@"query"][@"to"]);
        NSLog( @"result ::: %@", covertEndpoint[@"result"]);
    
    
        self.dateReceipt = covertEndpoint[@"date"];

        self.billNumber = [covertEndpoint[@"info"][@"timestamp"] stringValue ];
        self.rateReceipt = [covertEndpoint[@"info"][@"rate"] stringValue ];
        double covertResult = (double)  [covertEndpoint[@"result"]doubleValue ] ;
    
        resultCovertEndpoint = covertResult;
    
  
            //NSString *url_string = [NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=X&to=Y&amount=Z"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
      [exchangeTopTF resignFirstResponder];
      return YES;
}
@end
