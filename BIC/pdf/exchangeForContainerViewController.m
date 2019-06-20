//
//  exchangeForContainerViewController.m
//  BIC
//
//  Created by phongpadid on 5/15/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeForContainerViewController.h"
#import "exchangeWebviewViewController.h"
#import "mainViewController.h"

#define A4PaperSize CGRectMake(0, 0, 595.2, 841.8)

@interface exchangeForContainerViewController ()

@end

@implementation exchangeForContainerViewController

@synthesize  textLabel, theData, dictData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
     
    // set label text 
    textLabel.text = theData ;
    NSLog ( @"the dictData you are testing bay  :: %@", dictData );
    
//    // create button on the right top
//    UIBarButtonItem *btnSavePDF = [[ UIBarButtonItem alloc ] initWithTitle: @"Save as PDF" style: UIBarButtonItemStylePlain target: self action: @selector(Home:)];
//    // self.navigationItem.rightBarButtonItem = btnSavePDF;
//    self.navigationItem.rightBarButtonItem =  btnSavePDF ;

   
    }


-(void)viewWillAppear:(BOOL)animated
{
    [ self savePDF: self ];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //UINavigationController *navController = [segue destinationViewController];

    
    // if segue identifier is true than pass data to exchangeWebviewVC
    if ([segue.identifier  isEqual: @"toExchangeContainer"]) {
        
        exchangeWebviewViewController *tryText = segue.destinationViewController;
        tryText.testForWeb = @"haha bay ";
    }
    else  {
    }
    
    
    exchangeWebviewViewController *x ;
    x = [ segue destinationViewController];
    x.dictShowWeb = dictData ;
    
    
    
}

-(NSString *) getHTMLString {
    
    
    NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"exchange" ofType:@"html" ];
    NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
    
    // replace data from Dictionary to the webview
    if ( self.dictData ) {
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#fcAmount" withString: [ dictData valueForKey: @"fcAmount"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#lcAmount" withString: [ dictData valueForKey: @"lcAmount"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#address" withString: [ dictData valueForKey: @"address"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#country" withString: [ dictData valueForKey: @"country"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#phone" withString: [ dictData valueForKey: @"phone"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#date" withString: [ dictData valueForKey: @"date"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#billNumber" withString: [ dictData valueForKey: @"billNumber"]];
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#exchangeRate" withString: [ dictData valueForKey: @"exchangeRate"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#origin" withString: [ dictData valueForKey: @"origin"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#covert" withString: [ dictData valueForKey: @"covert"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#timestamp" withString: [ dictData valueForKey: @"timestamp"]];

        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#futurepickup" withString: [ dictData valueForKey: @"futurepickup"]];

    } else {
        
        NSLog( @" someting went wrong ! ");
    }
    
    
    NSLog (@"nsdic in the webviewpage ! = %@", self.tryData);
    return strHTML ;
    
}

-(IBAction)Home:(id)sender {
//    [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
    
//    UINavigationController *navController = (UINavigationController *)[self mainViewController];
//    [navController popToRootViewControllerAnimated:YES];
//    
//    NSLog( @"home is clicked ");
}


//-(IBAction)downloadPDF:(id)sender {
//
//
//    NSURL  *url = [NSURL URLWithString: self.buttonLinkPDF];
//    NSData *urlData = [NSData dataWithContentsOfURL:url];
//
//    if ( urlData )
//    {
//
//        //NSString *pdfBill =  [NSString stringWithFormat: @"/%@.pdf", dictData[@"timestamp"]];
//        NSString *pdfBillDowload = [ NSString stringWithFormat: @"/download%@.pdf", dictData[@"timestamp"]];
//        NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//
//        NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, pdfBillDowload];
//        [urlData writeToFile:filePath atomically:YES];
//    }
//    NSLog( @"downloadPDF");
//}


-(IBAction)savePDF:(id)sender {
    CGRect pageFrame = A4PaperSize ;
    
    
    // GENERATE PDF FILR
    UIPrintPageRenderer *printPageRenderer = [[ UIPrintPageRenderer alloc ] init ];
    [ printPageRenderer setValue: [ NSValue valueWithCGRect: pageFrame ] forKey: @"paperRect" ];
    [ printPageRenderer setValue: [ NSValue valueWithCGRect: pageFrame ] forKey: @"printableRect" ];
    
    UIPrintFormatter *printFormatter = [[ UIMarkupTextPrintFormatter alloc ] initWithMarkupText: [ self getHTMLString]];
    [printPageRenderer addPrintFormatter: printFormatter  startingAtPageAtIndex: 0 ];
    
    NSMutableData *pdfData = [[ NSMutableData alloc ] init ];
    UIGraphicsBeginPDFContextToData( pdfData , CGRectZero, nil );
    UIGraphicsBeginPDFPage();
    
    [ printPageRenderer drawPageAtIndex: 0  inRect: UIGraphicsGetPDFContextBounds()];
    UIGraphicsEndPDFContext();
    
    NSString *filePath = [ NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, true) objectAtIndex: 0 ];
    
    //------
    NSString *pdfBill =  [NSString stringWithFormat: @"/%@.pdf", dictData[@"timestamp"]];

    filePath = [ filePath stringByAppendingString: pdfBill ]; // use timestamp for generate file
    
    [ pdfData writeToFile: filePath atomically: true ];
    
    NSLog( @"%@", filePath );
    
    
    // UPLOAD TO FIREBASE STORAGE
    // Get a reference to the storage service using the default Firebase App
    FIRStorage *storage = [FIRStorage storage];
    
    // Create a storage reference from our storage service
    FIRStorageReference *storageRef = [storage reference];
    
    NSURL *URL = [ NSURL fileURLWithPath: filePath];
    NSLog( @" URL ::::::: %@", URL);
    
    //this new string link contain no dash if compare to pdfBill
    NSString *pdfBillNew =  [NSString stringWithFormat: @"%@.pdf", dictData[@"timestamp"]];

    // File located on disk
    //NSURL *localFile = [NSURL URLWithString:@"path/to/image"];
    NSString *userAuth = [FIRAuth auth].currentUser.uid;

    // Create a reference to the file you want to upload
    FIRStorageReference *riversRef = [[storageRef child: userAuth] child: pdfBillNew] ;
    
    // Upload the file to the path "images/rivers.jpg"
    FIRStorageUploadTask *uploadTask = [riversRef putFile: URL metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
            if (error != nil) {
                // Uh-oh, an error occurred!
            } else {
                    // Metadata contains file metadata such as size, content-type, and download URL.
                    int size = metadata.size;
                    // You can also access to download URL after upload.
                    [riversRef downloadURLWithCompletion:^(NSURL * _Nullable URL, NSError * _Nullable error) {
                        
                                if (error != nil) {
                                    // Uh-oh, an error occurred!
                                } else {
                                            NSURL *downloadURL = URL;
                                            NSLog( @"The downloadURL ::::: %@", downloadURL  );
                                    
                                            // timestamp since 1970
                                            NSUInteger currentTime = [[ NSDate date ] timeIntervalSince1970 ];
                                            NSString *receiptTimestamp = [ NSString stringWithFormat: @"%ld", currentTime ];
                                    
                                            NSString * receiptDownloadLink = downloadURL.absoluteString; // treat NSURL as string
                                            NSString * receiptKey = self->dictData[@"timestamp"];  /// this is the one !
                                    
                                    
                                    
                                    
                                    
                                    
                                            // ******* covert string date to timeinterval
                                            // get string from date picker
                                    
                                            NSString * futurepickup = self->dictData[@"futurepickup"];  /// this is the one !
                                            NSLog( @"future pick up in exchange %@ ", futurepickup);

                                            NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
                                        //    [dateFormatter setDateFormat:@"yyyy-M-dd"] ;
                                            [dateFormatter setDateFormat:@"dd-M-yyyy"] ;

                                    
                                            // string to NSDate
                                            NSDate *date = [dateFormatter dateFromString: futurepickup ] ;
                                            NSLog(@"date=%@",date) ;
                                    
                                            // get timestamp from 1970 - 2019-06-12 ( string that coverted to NSDate )
                                            NSTimeInterval interval  = [date timeIntervalSince1970] ;
                                            NSLog(@"interval=%.0f",interval) ;
                                        //    NSInteger intervalInt = round(interval);
                                    
                                            int intervalInt = (int)interval;
                                            NSString *intervalString = [ NSString stringWithFormat: @"%.0f", (float)intervalInt];
                                    
                                    
                                            NSDate *methodStart = [NSDate dateWithTimeIntervalSince1970:interval] ;
                                           // [dateFormatter setDateFormat:@"yyyy/M/dd "] ;
                                           [dateFormatter setDateFormat:@"dd-M-yyyy"] ;

                                            NSLog(@"result: %@", [dateFormatter stringFromDate:methodStart]) ;
                                    
                               
                                   
                                    
                                    
                                    if  ( futurepickup.length > 0  ) {
                                                    // for check future pick up
                                                    self.ref = [[[FIRDatabase database] reference] child: @"client"];
                                        
                                                    NSDictionary *pickup = [[ NSDictionary alloc ] init ];
                                                    pickup = @{
                                                               @"userID" : userAuth,
                                                               @"link" : receiptDownloadLink,
                                                               @"receiptID" : receiptKey,
                                                               @"status" : @"false",
                                                               @"futurepickup":futurepickup,
                                                               @"intervalPickupDate": intervalString,
                                                               @"serviceName": @"exchange",
                                                               @"mark" : @"🔴"
                                                               
                                                               };
                                                    [[self->_ref child: receiptKey ]  setValue:pickup];
                                        
                                                    // history
                                                    self.ref = [[[FIRDatabase database] reference] child: @"history"];
                                        
                                                    NSDictionary *history = [[ NSDictionary alloc ] init ];
                                                    history = @{
                                                                @"userID" : userAuth,
                                                                @"link" : receiptDownloadLink,
                                                                @"receiptID" : receiptKey,
                                                                @"status" : @"false",
                                                                @"futurepickup":futurepickup,
                                                                @"intervalPickupDate": intervalString,
                                                                @"serviceName": @"exchange",
                                                                @"mark" : @"🔴"
                                                                
                                                                };
                                                    [[self->_ref child: receiptKey ]  setValue:history];
                                        
                                        
                                                    // for check status
                                                    self.ref = [[[FIRDatabase database] reference] child: @"checkStatus"];
                                        
                                                    NSDictionary *checkStatus = [[ NSDictionary alloc ] init ];
                                                    checkStatus = @{
                                                                    @"userID" : userAuth,
                                                                    @"link" : receiptDownloadLink,
                                                                    @"receiptID" : receiptKey,
                                                                    @"status" : @"false",
                                                                    @"futurepickup":futurepickup,
                                                                    @"intervalPickupDate": intervalString,
                                                                    @"serviceName": @"exchange",
                                                                    @"mark" : @"🔴"
                                                                    
                                                                    };
                                                    [[self->_ref child: receiptKey ]  setValue:checkStatus];
                                    }
                                  
                                    else {
                                        
                                                // *******
                                        
                                                self.buttonLinkPDF = receiptDownloadLink; // copy than use for button download link
                                                // realtime database
                                                // Realtime datebse
                                                self.ref = [[[FIRDatabase database] reference] child: @"client"];
                                        
                                                //                    [[ self.ref child: userAuth ] updateChildValues: @{ receiptKey : receiptDownloadLink },
                                                //                                                                     @{ @"receiptNumber": receiptKey},
                                                //                                                                     @{ @"link": receiptDownloadLink}];
                                        
                                        
                                                NSDictionary *userData = [[ NSDictionary alloc ] init ];
                                        
                                                userData = @{
                                                             @"userID" : userAuth,
                                                             @"link" : receiptDownloadLink,
                                                             @"receiptID" : receiptKey,
                                                             @"status" : @"false",
                                                             @"serviceName": @"exchange"
                                                             
                                                             };
                                                [[self->_ref child: receiptKey ]  setValue:userData];
                                        
                                        
                                                // for check status
                                                self.ref = [[[FIRDatabase database] reference] child: @"checkStatus"];
                                        
                                                NSDictionary *checkStatus = [[ NSDictionary alloc ] init ];
                                                checkStatus = @{
                                                                @"userID" : userAuth,
                                                                @"link" : receiptDownloadLink,
                                                                @"receiptID" : receiptKey,
                                                                @"status" : @"false",
                                                                @"serviceName": @"exchange"
                                                                
                                                                };
                                                [[self->_ref child: receiptKey ]  setValue:checkStatus];
                                        
                                                // history
                                                self.ref = [[[FIRDatabase database] reference] child: @"history"];
                                        
                                                NSDictionary *history = [[ NSDictionary alloc ] init ];
                                                history = @{
                                                            @"userID" : userAuth,
                                                            @"link" : receiptDownloadLink,
                                                            @"receiptID" : receiptKey,
                                                            @"status" : @"false",
                                                            @"serviceName": @"exchange"
                                                            
                                                            };
                                                [[self->_ref child: receiptKey ]  setValue:history];
                                    }
                                }
                         }];
                   }
           }];
      }




- (IBAction)goHome:(id)sender {
    
//    UIViewController *controler = [[ UIViewController alloc ] init ];
//    [ self.navigationController pushViewController: controler  animated: YES ];

    
//    [self.navigationController popToRootViewControllerAnimated:YES];

    mainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"sidebarPage"];
    [self.navigationController pushViewController: mainView animated:YES];

}
@end
