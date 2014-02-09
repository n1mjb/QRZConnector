//
//  QRZContainer.m
//  QRZConnector
//
//  Created by Matthew on 2/8/14.
//  Copyright (c) 2014 Matthew J Beauchesne. All rights reserved.
//

#import "QRZContainer.h"

@implementation QRZContainer

@synthesize call;
@synthesize licenseClass;
@synthesize firstName;
@synthesize lastName;
@synthesize addr1;
@synthesize addr2;
@synthesize state;
@synthesize county;
@synthesize zip;
@synthesize country;
@synthesize lat;
@synthesize lon;
@synthesize grid;

-(id)initWithDictionary:(NSMutableDictionary *)dictionary
{
    call = [dictionary objectForKey:@"call"];
    licenseClass = [dictionary objectForKey:@"class"];
    firstName = [dictionary objectForKey:@"fname"];
    lastName = [dictionary objectForKey:@"name"];
    addr1 = [dictionary objectForKey:@"addr1"];
    addr2 = [dictionary objectForKey:@"addr2"];
    state = [dictionary objectForKey:@"state"];
    county = [dictionary objectForKey:@"county"];
    zip = [dictionary objectForKey:@"zip"];
    country = [dictionary objectForKey:@"country"];
    lat = [NSNumber numberWithFloat:[[dictionary objectForKey:@"lat"] floatValue]];
    lon = [NSNumber numberWithFloat:[[dictionary objectForKey:@"lon"] floatValue]];
    grid = [dictionary objectForKey:@"grid"];
    
    return [self init];
}
@end
