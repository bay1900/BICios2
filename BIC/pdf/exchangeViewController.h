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

@end

NS_ASSUME_NONNULL_END
