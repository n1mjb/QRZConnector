//
//  QRZContainer.m
//  QRZConnector
//
//  Created by Matthew on 2/8/14.
//  Copyright (c) 2014 Matthew J Beauchesne. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface QRZContainer : NSObject

@property NSString *call;
@property NSString *licenseClass;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *addr1;
@property NSString *addr2;
@property NSString *state;
@property NSString *county;
@property NSString *zip;
@property NSString *country;
@property NSNumber *lat;
@property NSNumber *lon;
@property NSString *grid;

-(id) initWithDictionary:(NSMutableDictionary *)dictionary;

@end
