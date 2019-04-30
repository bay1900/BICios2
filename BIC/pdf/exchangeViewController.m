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
    
    
                    // No interaction of "Textfield botton"
                    [ self.exchangeBottomTF setUserInteractionEnabled:  NO ];
    
                    // origin
                    self.data = [[ NSArray alloc ] initWithObjects: @"1", @"2", @"3",@"1", @"2", @"3",@"1", @"2", @"3", nil];
                    self.tableViewO.delegate = self;
                    self.tableViewO.dataSource = self ;
    
                    //set all tableview hidden when page is loaded
                    if ( self.tableViewO.hidden == YES ) {
                        [ self.tableViewO setHidden: NO ];
                    }
                    else
                        [ self.tableViewO setHidden: YES ];
    
                    // covert
                    self.dataCovert = [[ NSArray alloc ] initWithObjects: @"a", @"b", @"c", @"a", @"b", @"c", @"a", @"b", @"c", nil];
                    self.tableviewCovert.delegate = self;
                    self.tableviewCovert.dataSource = self;
    
                    //set all tableview hidden when page is loaded
                    if ( self.tableviewCovert.hidden == YES ) {
                        [ self.tableviewCovert setHidden: NO ];
                    }
                    else
                        [ self.tableviewCovert setHidden: YES ];
    
    
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
    
    
                    if ( tableView == _tableViewO) {
                        return [ self.data count] ;
                    }
                    else if (tableView == _tableviewCovert) {
                        return  [ self.dataCovert count ];
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
                        
                        
                               NSString *originSymbol = cell.textLabel.text ;
                               NSLog(  @"Origin amount : %@",  originSymbol );
                        
                              [ self getValue: originSymbol ];
                    
                    }
                    else if ( tableView == _tableviewCovert) {
                        
                                // get the value of tableview index selected
                                UITableViewCell *cell = [ self.tableviewCovert cellForRowAtIndexPath: indexPath ];
                        
                                // set button text as tableview path value selected
                                [self.buttonCovert setTitle: cell.textLabel.text  forState: UIControlStateNormal ];
                        
                                //hide tableview when cell any cell is clicked
                                self.tableviewCovert.hidden = YES;
                        
                                NSString *covertSymbol = cell.textLabel.text ;
                                NSLog(  @"Origin amount : %@",  covertSymbol );
                        
                        
                        
                    }
                    else {
                        
                                NSLog( @"Something went wrong on didSelectRowAtIndexPath ");
                    }

    
}

- (void) getValue:(NSString *) origin{
    
   // NSString *x =  [[ self buttonCovert]titleLabel];
    
    
   
    
    
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
    
    
 
   // Origin and covert button symbol
     NSString *x = _buttonCovert.titleLabel.text;
     NSString *y =  _btnOutlet.titleLabel.text;
  
    
    NSLog( @"This is the button outlet: %@ and this is the button covert: %@ ", y, x  ); 
    
}
- (IBAction)buttonCovert:(id)sender {
}
@end
