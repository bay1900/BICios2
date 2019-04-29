//
//  exchangeViewController.m
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeViewController.h"
#import "exchangeWebviewViewController.h"

@interface exchangeViewController ()

@end

@implementation exchangeViewController


@synthesize exchangeTopTF, exchangeBottomTF;


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.data = [[ NSArray alloc ] initWithObjects: @"1", @"2", @"3", nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self ;
    
    //set all tableview hidden when page is loaded
    if ( self.tableView.hidden == YES ) {
        [ self.tableView setHidden: NO ];
    }
    else
        [ self.tableView setHidden: YES ];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)openHTML:(id)sender {

  
    
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

// drop down table view
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
        if ( cell == nil ) {
            
            cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
            
        }
    
    cell.textLabel.text = [ self.data objectAtIndex: indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ self.data count] ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get the value of tableview index selected
    UITableViewCell *cell = [ self.tableView cellForRowAtIndexPath: indexPath ];
    
    // set button text as tableview path value selected
    [self.btnOutlet setTitle: cell.textLabel.text  forState: UIControlStateNormal ];
    
    //hide tableview when cell any cell is clicked 
    self.tableView.hidden = YES;
    
}

// Origin currency button
- (IBAction)btnAction:(id)sender {
    
    if ( self.tableView.hidden == YES ) {
        [ self.tableView setHidden: NO ];
    }
    else
        [ self.tableView setHidden: YES ];
    
}



@end
