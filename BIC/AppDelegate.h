//
//  AppDelegate.h
//  BIC
//
//  Created by phongpadid on 4/4/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@import Firebase; //  firebase class connection

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) FIRDatabaseReference *ref;



- (void)saveContext;
-(void)setCornerRadius;

 @property (nonatomic, strong) NSArray *checkStatusArray;
 @property (nonatomic, strong) NSMutableArray *checkStatusArrayMutable;
 @property (nonatomic, strong ) NSDictionary *dictionaryStatus;

@end

