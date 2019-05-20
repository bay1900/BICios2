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

@synthesize  textLabel, theData ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // set label text 
    textLabel.text = theData ;
    
    
    //    // create button on the right top
    UIBarButtonItem *btnSavePDF = [[ UIBarButtonItem alloc ] initWithTitle: @"Save as PDF" style: UIBarButtonItemStylePlain target: self action: @selector(savePDF:)];
    // self.navigationItem.rightBarButtonItem = btnSavePDF;
    self.navigationItem.rightBarButtonItem =  btnSavePDF ;

   
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
}


-(NSString *) getHTMLString {
    
    
    NSString *filePath = [[ NSBundle mainBundle ] pathForResource: @"exchange" ofType:@"html" ];
    NSString *strHTML = [ NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil ];
    
    // replace data from Dictionary to the webview
    if ( self.tryData ) {
        
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#name" withString: [ _tryData valueForKey: @"nameKey"]];
        strHTML = [ strHTML stringByReplacingOccurrencesOfString: @"#age" withString: [ _tryData valueForKey: @"ageKey"]];
        
    }
    else {
        
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
    filePath = [ filePath stringByAppendingString: @"/demo2.pdf"];
    
    [ pdfData writeToFile: filePath atomically: true ];
    
    NSLog( @"%@", filePath ); 
}




@end
