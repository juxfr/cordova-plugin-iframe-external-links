/*
 Copyright 2013-2014 appPlant UG

 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "IframeExternalLinks.h"

@implementation IframeExternalLinks

- (void) initPlugin:(CDVInvokedUrlCommand*)command
{
    
}


- (BOOL)webView:(UIWebView *)theWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    // Intercept the external http requests and forward to Safari.app
    // Otherwise forward to the PhoneGap WebView
    // Avoid opening iFrame URLs in Safari by inspecting the `navigationType` && [[url scheme] isEqualToString:@"#external"]
    //if ((navigationType == UIWebViewNavigationTypeLinkClicked) && [[url scheme] isEqualToString:@"ligatus"] && ([[url scheme] isEqualToString:@"http"] || [[url scheme] isEqualToString:@"https"])) {
    if((navigationType == UIWebViewNavigationTypeLinkClicked) && ([[NSString stringWithFormat:@"%@",url] rangeOfString:@"taboola"].location != NSNotFound)) {
        [[UIApplication sharedApplication] openURL:url];
        //NSLog(@"URL1: %@", url);
        return NO;
    } else if((navigationType == UIWebViewNavigationTypeLinkClicked) && ([[NSString stringWithFormat:@"%@",url] rangeOfString:@"elasticad"].location != NSNotFound)) {
            [[UIApplication sharedApplication] openURL:url];
            //NSLog(@"URL1: %@", url);
            return NO;
    } else{
        //NSLog(@"URL2: %@", url);
        return [ super webView:theWebView shouldStartLoadWithRequest:request navigationType:navigationType ];
    }
}

@end
