//
//  LandingPageViewController.m
//  BIC
//
//  Created by phongpadid on 4/11/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "LandingPageViewController.h"




@interface LandingPageViewController ()

@end

@implementation LandingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    // check internet connection
    
    
    [ self tryData ];
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
    NSMutableArray *myValue;    // store values
    
    
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
        NSString *string_one = @"One";

        NSString *x = value;
        NSString *y = key;
        
        
        
        
        [ myCurrency addObject: key ];
        


      }
    
    NSLog( @"gg:::::::::::%@", myCurrency );

    

    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    NSString *string_one = @"One";
    [mutableArray addObject:string_one];
    //Or
    [mutableArray addObject:@"Two"];
    NSLog(@"%@", mutableArray);
    
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
@end
