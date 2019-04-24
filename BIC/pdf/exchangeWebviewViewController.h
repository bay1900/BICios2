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

@interface exchangeWebviewViewController : UIViewController

@property (nonatomic, strong ) NSDictionary *dictData;
//@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
