//
//  JSONPDFViewController.m
//  JSONPDF
//
//  Created by Macbook on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//	@Desc
//	Reads JSON file and displays the PDF titles and authors
//

#import "JSONPDFViewController.h"

@implementation JSONPDFViewController

@synthesize jsonData;
@synthesize titles;
@synthesize authors;

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	self.title = @"PDF JSON"; 
	
	pdfFiles = [[NSMutableArray alloc] init];;
	titles = [[NSMutableArray alloc] init];
	authors = [[NSMutableArray alloc] init];
	
    jsonData = [[NSMutableString alloc] initWithString:@""];   
    NSString *urlString = [NSString stringWithFormat: @"http://haifa.baluyos.net/dev/JSONPDF/books.json"];
	
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    [connection release];
    [request release]; 
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *partialData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];   
    [jsonData appendString:partialData];   
    [partialData release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	
    NSDictionary *filesJSON = [jsonData JSONValue];

	
    NSArray *files = [filesJSON objectForKey:@"files"];
    
	
	NSLog(@"Found %d files", [files count]);
	
	
	 for (NSDictionary *file in files)
	 {       
		 NSString *fileTitle = [file objectForKey:@"title"];
		 NSString *author = [file objectForKey:@"author"];
		 
		 [titles addObject: fileTitle];
		 [authors addObject: author];
		 
	}
	
	mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
	[mainTableView setDataSource:self];
	[mainTableView setDelegate:self];
	[self.view addSubview:mainTableView];
	
}

// TABLE CONFIGURATIONS HERE

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [titles count];
	
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell"; 
    
	// if a cell can be reused, it returns a UITableViewCell with the associated identifier or nil if no such cell exists
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	// if no cell to reuse, then create a new one
    if (cell == nil) {
		
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		
	}
	
	// Set up the cell...	
	cell.textLabel.text = [titles objectAtIndex:indexPath.row];
	cell.detailTextLabel.text = [authors objectAtIndex:indexPath.row];
	
    return cell;
}


- (void)dealloc {
	[mainTableView release]; 
    [super dealloc];
}

@end
