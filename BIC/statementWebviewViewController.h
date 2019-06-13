//
//  statementWebviewViewController.h
//  BIC
//
//  Created by phongpadid on 6/11/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>  // webkit for webview

NS_ASSUME_NONNULL_BEGIN

@interface statementWebviewViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet WKWebView *webViewStatement;

@property (nonatomic, strong ) NSDictionary *dictData;

@property (nonatomic, strong ) NSDictionary *dictShowWeb;
@end

NS_ASSUME_NONNULL_END
