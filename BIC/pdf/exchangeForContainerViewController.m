//
//  exchangeForContainerViewController.m
//  BIC
//
//  Created by phongpadid on 5/15/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import "exchangeForContainerViewController.h"
#import "exchangeWebviewViewController.h"

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
    UIBarButtonItem *btnSavePDF = [[ UIBarButtonItem alloc ] initWithTitle: @"Save as PDF" style: UIBarButtonItemStylePlain target: self action: @selector(savePDF:)];
    // self.navigationItem.rightBarButtonItem = btnSavePDF;
    self.navigationItem.rightBarButtonItem =  btnSavePDF ;

   
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
    } else {
        
        NSLog( @" someting went wrong ! ");
    }
    
    
    NSLog (@"nsdic in the webviewpage ! = %@", self.tryData);
    return strHTML ;
    
}



-(IBAction)savePDF:(id)sender {
    CGRect pageFrame = A4PaperSize ;
    
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
    filePath = [ filePath stringByAppendingString: @"/demo5.pdf"];
    
    [ pdfData writeToFile: filePath atomically: true ];
    
    NSLog( @"%@", filePath );
    
  ////////
    
    // Get a reference to the storage service using the default Firebase App
    FIRStorage *storage = [FIRStorage storage];
    
    // Create a storage reference from our storage service
    FIRStorageReference *storageRef = [storage reference];
    
    NSURL *URL = [ NSURL fileURLWithPath: filePath];
    NSLog( @" URL ::::::: %@", URL);
    
    
    // File located on disk
    //NSURL *localFile = [NSURL URLWithString:@"path/to/image"];
    
    // Create a reference to the file you want to upload
    FIRStorageReference *riversRef = [storageRef child:@"images/xx.pdf"];
    
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
                }
            }];
        }
    }];
    
    

    
}




@end
