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
    
                    // origin
                    self.data = [[ NSArray alloc ] initWithObjects: @"1", @"2", @"3", nil];
                    self.tableViewO.delegate = self;
                    self.tableViewO.dataSource = self ;
    
                    //set all tableview hidden when page is loaded
                    if ( self.tableViewO.hidden == YES ) {
                        [ self.tableViewO setHidden: NO ];
                    }
                    else
                        [ self.tableViewO setHidden: YES ];
    
                    // covert
                    self.dataCovert = [[ NSArray alloc ] initWithObjects: @"a", @"b", @"c", nil];
                    self.tableviewCovert.delegate = self;
                    self.tableviewCovert.dataSource = self;
    
                    //set all tableview hidden when page is loaded
                    if ( self.tableviewCovert.hidden == YES ) {
                        [ self.tableviewCovert setHidden: NO ];
                    }
                    else
                        [ self.tableviewCovert setHidden: YES ];
    
    
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
    
    
    
               // static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
               // UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
               // if ( cell == nil ) {
                    
              //           cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
                    
               // }
    
               // cell.textLabel.text = [ self.data objectAtIndex: indexPath.row];
               // cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
               // return  cell;
    
            static NSString *simpleTableIdentifier = @"SimpleTableItem";
            UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
            if ( tableView == _tableViewO ) {
                
                
                
                 cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
                
                 cell.textLabel.text = [ self.data objectAtIndex: indexPath.row];
                 cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
                // return  cell;
                NSLog( @"Tableview 1");
                
            }
            else if ( tableView == _tableviewCovert) {
                
                
                 cell = [[ UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier ];
              
                 cell.textLabel.text = [ self.dataCovert objectAtIndex: indexPath.row];
                 cell.textLabel.textAlignment = NSTextAlignmentCenter;    // alight text center in tableview
                
                 NSLog( @"Tableview 2");
                
            }
            else {
                
                 NSLog( @"Tableview erroe");
            }
    
           return cell ;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
               return [ self.data count] ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
                    if ( tableView == _tableViewO ) {
                        
                                // get the value of tableview index selected
                                UITableViewCell *cell = [ self.tableViewO cellForRowAtIndexPath: indexPath ];
                        
                                // set button text as tableview path value selected
                                [self.btnOutlet setTitle: cell.textLabel.text  forState: UIControlStateNormal ];
                        
                                //hide tableview when cell any cell is clicked
                                self.tableViewO.hidden = YES;
                        
                    }
                    else if ( tableView == _tableviewCovert) {
                        
                                // get the value of tableview index selected
                                UITableViewCell *cell = [ self.tableviewCovert cellForRowAtIndexPath: indexPath ];
                        
                                // set button text as tableview path value selected
                                [self.buttonCovert setTitle: cell.textLabel.text  forState: UIControlStateNormal ];
                        
                                //hide tableview when cell any cell is clicked
                                self.tableviewCovert.hidden = YES;
                    }
                    else {
                    }
    
}

// Origin currency button
- (IBAction)btnAction:(id)sender {
    
                if ( self.tableViewO.hidden == YES ) {
                    [ self.tableViewO setHidden: NO ];
                }
                else
                    [ self.tableViewO setHidden: YES ];
    
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



- (IBAction)covertButton:(id)sender {
    
    if ( self.tableviewCovert.hidden == YES ) {
        [ self.tableviewCovert setHidden: NO ];
    }
    else
        [ self.tableviewCovert setHidden: YES ];
}
@end
