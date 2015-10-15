//
//  AppDelegate.m
//  PlayingWithCoreDataiOS7Stanford
//
//  Created by Peter Molnar on 15/10/2015.
//  Copyright © 2015 Peter Molnar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) UIManagedDocument *document;
@property (strong, nonatomic) NSManagedObjectContext *context;
@end

@implementation AppDelegate


- (void)documentIsReady
{
    if (self.document.documentState == UIDocumentStateNormal) {
        NSLog(@"State is normal. Go ahead");
        self.context = [self.document managedObjectContext];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //   Prepare objects for UIManagedDocment initialisation
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory
                                                     inDomains:NSUserDomainMask] firstObject];
    //    Name of the sqlite file
    NSString *documentName = @"MyDocument";
    NSURL *url = [documentsDirectory URLByAppendingPathComponent:documentName];
    
    self.document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    //    File exists check
    BOOL fileExist = [fileManager fileExistsAtPath:[url path]];
    if (fileExist)
    {
        [self.document openWithCompletionHandler:^(BOOL success) {
            if(success) [self documentIsReady];
            if (!success) NSLog(@"Couldn't open document at %@", url);
        }];
    } else {
        [self.document saveToURL:url
                forSaveOperation:UIDocumentSaveForCreating
               completionHandler:^(BOOL success) {
                   if(success) [self documentIsReady];
                   if (!success) NSLog(@"Couldn't create document at %@", url);
               }];
        
        
    }
    return YES;
}

@end
