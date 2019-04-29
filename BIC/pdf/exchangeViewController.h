//
//  exchangeViewController.h
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface exchangeViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>


//@property (strong, nonatomic) IBOutlet UITextField *name;
//@property (strong, nonatomic) IBOutlet UITextField *age;

@property (strong, nonatomic) IBOutlet UITextField *exchangeTopTF;
@property (strong, nonatomic) IBOutlet UITextField *exchangeBottomTF;


- (IBAction)openHTML:(id)sender;


//- (IBAction)btnOpenHTML:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnOutlet;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *data;


- (IBAction)btnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
