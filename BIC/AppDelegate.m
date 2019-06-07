//
//  AppDelegate.m
//  BIC
//
//  Created by phongpadid on 4/4/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "AppDelegate.h"
@import Firebase; //  firebase class connection

@import UserNotifications;
@import EstimoteProximitySDK;

@interface AppDelegate () <UNUserNotificationCenterDelegate, UIApplicationDelegate>

// 1. Add a property to hold the Proximity Observer
@property(strong, nonatomic) EPXProximityObserver *proximityObserver;



@end

@implementation AppDelegate
@synthesize  ref ;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [FIRApp configure];   // firebase
    

    

    
    
    
    // estimote
    UNUserNotificationCenter *notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    notificationCenter.delegate = self;
    [notificationCenter requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionSound
                                      completionHandler:^(BOOL granted, NSError *_Nullable error) {
                                          NSLog(@"notifications permission granted = %d, error = %@", granted, error);
                                      }];
    
    EPXCloudCredentials *estimoteCloudCredentials = [[EPXCloudCredentials alloc] initWithAppID:@"bicapp-9ci" appToken:@"ba9bba484b0dc4cbe7697d80c8bd8253"];  // iBeacon cloud `appID` and `appToken`
    
    // error handler
    self.proximityObserver = [[EPXProximityObserver alloc] initWithCredentials:estimoteCloudCredentials
                                                                       onError:^(NSError *_Nonnull error) {
                                                                           NSLog(@"EPXProximityObserver error: %@", error);
                                                                       }];
    
    EPXProximityZone *zone = [[EPXProximityZone alloc] initWithTag:@"bicapp-9ci" range:[EPXProximityRange nearRange]]; // tags id `my ice iBeacon ` find this in estimote cloud
    
    
    // Enter
    zone.onEnter = ^(EPXProximityZoneContext *context) {
        
         NSLog( @"ENTER ENTER ENTER " );
        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
        content.title = @"Hello";
        content.body = @"You're near your tag";
        content.sound = [UNNotificationSound defaultSound];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"enter" content:content trigger:nil];
        [notificationCenter addNotificationRequest:request withCompletionHandler:nil];
        
       // ----------  check order status  ----------
        
        

        // firebase
        NSString *userAuth = [FIRAuth auth].currentUser.uid;

        NSLog( @"The userAuth delegate ::: %@", userAuth );
        
        if (  userAuth != nil ) {

                // realtime database
                self.ref = [[FIRDatabase database] reference];

                [[self.ref child:@"checkStatus"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {

                NSDictionary *checkStatus = snapshot.value;

                //  NSLog(@"Info : %@",checkStatus);

                NSArray *checkStatusArray = [ checkStatus allValues];
                NSLog( @"checkStatus %@" , checkStatusArray );

                for ( NSString * x in checkStatus ) {

                        NSString * link = checkStatus[x][@"link"];

                        NSString * receiptID = checkStatus[x][@"receiptID"];//
                        NSLog( @"receiptID :: %@  ", receiptID );

                        NSString * userIDstatus = checkStatus[x][@"userID"];//
                        NSLog( @"userID :: %@  ", userIDstatus );

                        NSString * status = checkStatus[x][@"status"];//
                        NSLog( @"status :: %@  ", status );
                    
                                        if ( [ status  isEqual: @"false"] ) {

                                        NSLog( @"xx :: %@", receiptID );

                                        // update data
                                        self.ref = [[[FIRDatabase database] reference] child: @"checkStatus"];


                                        NSDictionary *updateCheckStatus = [[ NSDictionary alloc ] init ];

                                        updateCheckStatus = @{
                                        @"link" : link,
                                        @"receiptID": receiptID,
                                        @"status" : @"true",
                                        @"userID" :userIDstatus
                                        };

                                        [[self->ref child: receiptID ]  setValue: updateCheckStatus];

                                        NSLog( @"update done !!!!!!!");
                                        }
                                        else {

                                        }
                                }
                      }];
               }
       // ------------------------------------------
    };
    // Exit
    zone.onExit = ^(EPXProximityZoneContext *context) {
        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
        content.title = @"Bye bye";
        content.body = @"You've left the proximity of your tag";
        content.sound = [UNNotificationSound defaultSound];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"exit" content:content trigger:nil];
        [notificationCenter addNotificationRequest:request withCompletionHandler:nil];
    };
    
    [self.proximityObserver startObservingZones:@[ zone ]];
    // end estimote
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BIC"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}



// Needs to be implemented to receive notifications both in foreground and background
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
}


//-(void)setCornerRadius {
//    UIView *viewCheck = [[ UIView alloc ] init ];
//    viewCheck.layer.shadowRadius  = 1.5f;
//    viewCheck.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
//    viewCheck.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
//    viewCheck.layer.shadowOpacity = 0.9f;
//    viewCheck.layer.masksToBounds = NO;
//    
//    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
//    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(viewCheck.bounds, shadowInsets)];
//    viewCheck.layer.shadowPath    = shadowPath.CGPath;
//}


-(void)setCornerRadius {
    NSLog( @"setCornerRadius");
}

@end
