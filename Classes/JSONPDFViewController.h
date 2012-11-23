//
//  JSONPDFViewController.h
//  JSONPDF
//
//  Created by Macbook on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
//
@interface JSONPDFViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSMutableString *jsonData;
	NSMutableArray *pdfFiles;
	NSMutableArray *titles;
	NSMutableArray *authors;
	UITableView *mainTableView;
}

@property(nonatomic, retain) NSMutableString *jsonData;
@property(nonatomic, retain) NSMutableArray *titles;
@property(nonatomic, retain) NSMutableArray *authors;

@end

