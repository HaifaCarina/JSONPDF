//
//  JSONPDFAppDelegate.h
//  JSONPDF
//
//  Created by Macbook on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSONPDFViewController;

@interface JSONPDFAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JSONPDFViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JSONPDFViewController *viewController;

@end

