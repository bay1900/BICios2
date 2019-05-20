//
//  exchangeWebviewViewController.h
//  BIC
//
//  Created by phongpadid on 4/23/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>  // webkit for webview


NS_ASSUME_NONNULL_BEGIN

@interface exchangeWebviewViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong ) NSDictionary *dictData;
//@property (strong, nonatomic) IBOutlet UIWebView *webView;

// (strong, nonatomic) IBOutlet WKWebView *webview;

@property (strong, nonatomic) IBOutlet WKWebView *webview;

// no need
@property (strong, nonatomic) IBOutlet UILabel *testTextWeb;
@property (strong, nonatomic) NSString *testForWeb;


@end

NS_ASSUME_NONNULL_END
