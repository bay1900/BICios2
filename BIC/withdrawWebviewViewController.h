//
//  withdrawWebviewViewController.h
//  BIC
//
//  Created by phongpadid on 6/13/19.
//  Copyright © 2019 phongpadid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>  // webkit for webview

NS_ASSUME_NONNULL_BEGIN

@interface withdrawWebviewViewController : UIViewController
@property (strong, nonatomic) IBOutlet WKWebView *webViewWithdraw;
@property (nonatomic, strong ) NSDictionary *dictShowWeb;

@end

NS_ASSUME_NONNULL_END
