//
//  LandingPageViewController.m
//  BIC
//
//  Created by phongpadid on 4/11/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "LandingPageViewController.h"


@import Firebase;


@interface LandingPageViewController ()

@end

@implementation LandingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   
    // check if user hasn't log out redirect them somewhere
    // they have already signed in // token still alive
    if ( [ FIRAuth auth ].currentUser ) {
        NSLog( @"Currently signed in");
        
    }else {
        NSLog( @"Not signed in yet !" );
    }
    
    
    
    // Log out firebase session
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }else{
        NSLog(@"Successfully Signout");
    }
    
    
    
    // check internet connection
    
//    int i = 1;
//    NSString *name = @"thefirstsong";
//    NSString *filename = [NSString stringWithFormat:@"%0d-%@.mp3", i, name];
//    NSLog(@" +++++++ %@", filename);

    
    
   
    
//    NSString *yes = [ NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=%@&to=%@&amount=%@", x, y, z ];
//    NSLog(@" +++++++ %@", yes);

//    NSString *url_string = [NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=X&to=Y&amount=Z"];
   // [ self tryData ];
   // [ self fixerCovert ];
    
  }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerLand:(id)sender {
  
    
    
}

- (IBAction)loginLand:(id)sender {
    
   // UIStoryboard *mainStoryboard = [ UIStoryboard storyboardWithName:@"Main" bundle: nil ];
   //UIViewController *vc = [ mainStoryboard instantiateViewControllerWithIdentifier: @"loginPage"];
   //[ self presentViewController: vc animated: YES completion: nil ];
    
}


-(void)tryData {
    
    
    NSMutableArray *myCurrency = [[ NSMutableArray alloc] init ] ; // store currency name
    NSMutableArray *myValue = [[ NSMutableArray alloc ] init ];    // store values
    
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://data.fixer.io/api/latest?access_key=2056ca64bc11aa6cad1a18a1e191f957&format=1"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSMutableDictionary *j =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
  //  NSLog( @"the rate %@", j[@"rates"]);
    //NSLog(@"json: %@", json);
    
  //  NSLog( @"the rate %@", j[@"rates"]);
    
    for (NSString * key in j[@"rates"]) {
                        NSString *value = [j[@"rates"] objectForKey:key];
                      //  NSLog(@"areacodedisplay: value = %@",value);
                        //NSLog(@"areacodedisplay: key = %@",key);
      //  NSString *string_one = @"One";

        //NSString *x = value;
       // NSString *y = key;
        
        
        
        
        [ myCurrency addObject: key ];
        [ myValue addObject: value ];
        // treat  JSON data as  NSArray for tableview
        self.cur = [[NSArray alloc] initWithArray: myCurrency];
        self.rate = [[ NSArray alloc ] initWithArray: myValue ];
        
        //NSLog( @"the cur array %@", self.cur );
       // NSLog( @"the rate array %@", self.rate );


      }
    
    
     self.theIndex = (int)[_cur indexOfObject: @"AUD"];
    
    NSLog( @" OOOOOOOOO:::::::::::%@", j );
    NSLog( @" OOOOOOOOO:::::::::::%d", self.theIndex );
    NSLog( @" OOOOOOOOO:::::::::::%@", _rate[ self.theIndex ] );

//NSLog( @"gg:::::::::::%@", myValue );
    
  
//NSLog( @"the rate ..... %@""""", self.rate[1] );
    

//NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
  //  NSString *string_one = @"One";
//[mutableArray addObject:string_one];
    //Or
//    [mutableArray addObject:@"Two"];
//NSLog(@"%@", mutableArray);
    
    // check indexofObject of the string in an array
    NSLog(  @" the indexOfOBJECT%lu", (unsigned long)[ myCurrency indexOfObject: @"HRK" ] );
    
                    // check internet connecton by checking if coming data
                    if ( data ) {
                        NSLog( @":::::::::::::::: INTERNET IS ACTIVE :::::::::::::::::");
                    }
                    else  {
                        NSLog( @":::::::::::::::: INTERNET CONNECTION FAIL :::::::::::::::::");

                    }

    }


-(void)fixerCovert {
//    NSError *error;
//    NSString *url_string = [NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=AUD&to=USD&amount=10"];
//    //NSString *url_string = [NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=X&to=Y&amount=Z"];
//
//
//    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: url_string ]];
//    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error ];
//   
//    
//    NSMutableDictionary *j =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error];
//    NSLog( @"date ::: %@", j[@"date"]);
//    NSLog( @"query ::: %@", j[@"query"][@"to"]);
//    
//    
//    NSString *x = @"AUD";
//    NSString *y = @"USD";
//    NSString *z = @"10";
//    
//        NSString *yes = [ NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=%@&to=%@&amount=%@", x, y, z ];
//        NSLog(@" +++++++ %@", yes);
//    
//        //NSString *url_string = [NSString stringWithFormat: @"https://data.fixer.io/api/convert?access_key=2056ca64bc11aa6cad1a18a1e191f957&from=X&to=Y&amount=Z"];
//     [ self tryData ];
//     [ self fixerCovert ];
}
@end
