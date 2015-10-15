//
//  Photo+CoreDataProperties.h
//  PlayingWithCoreDataiOS7Stanford
//
//  Created by Peter Molnar on 15/10/2015.
//  Copyright © 2015 Peter Molnar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSDate *uploadDate;
@property (nullable, nonatomic, retain) NSString *thumnailURL;
@property (nullable, nonatomic, retain) NSData *thumbnailData;
@property (nullable, nonatomic, retain) NSString *subtitle;
@property (nullable, nonatomic, retain) NSString *photoURL;
@property (nullable, nonatomic, retain) Photographer *whoTook;

@end

NS_ASSUME_NONNULL_END
