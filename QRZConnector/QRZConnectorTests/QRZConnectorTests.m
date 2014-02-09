//
//  QRZConnectorTests.m
//  QRZConnectorTests
//
//  Created by Matthew on 2/8/14.
//  Copyright (c) 2014 Matthew J Beauchesne. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "QRZConnector.h"
#import "QRZContainer.h"

@interface QRZConnectorTests : XCTestCase

@end

@implementation QRZConnectorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRetrieve
{
    
    char str[100];
    
    printf("Enter a user name: ");
    scanf("%s", str);
    
    NSString *userName = [NSString stringWithUTF8String:str];

    printf("Enter the password: ");
    scanf("%s", str);
    
    NSString *passwd = [NSString stringWithUTF8String:str];

    printf("Enter a callsign: ");
    scanf("%s", str);
    
    NSString *callSign = [NSString stringWithUTF8String:str];
    
    // Create the retriever object and login to get key.
    QRZConnector *qrzRetriever = [[QRZConnector alloc] initWithUserName:userName andPassword:passwd];
    
    // Retrieve QRZ data from website.
    NSMutableDictionary *qrzData = [qrzRetriever getQRZData:callSign];
    
    QRZContainer *qrzObj = [[QRZContainer alloc] initWithDictionary:qrzData];
    NSLog(@"call = %@", [qrzObj call]);
    NSLog(@"licenseClass = %@", [qrzObj licenseClass]);
    NSLog(@"firstName = %@", [qrzObj firstName]);
    NSLog(@"lastName = %@", [qrzObj lastName]);
    NSLog(@"addr1 = %@", [qrzObj addr1]);
    NSLog(@"addr2 = %@", [qrzObj addr2]);
    NSLog(@"state = %@", [qrzObj state]);
    NSLog(@"county = %@", [qrzObj county]);
    NSLog(@"zip = %@", [qrzObj zip]);
    NSLog(@"country = %@", [qrzObj country]);
    NSLog(@"lat = %@", [qrzObj lat]);
    NSLog(@"lon = %@", [qrzObj lon]);
    NSLog(@"grid = %@", [qrzObj grid]);
    
    XCTAssertEqualObjects([qrzObj call], [callSign uppercaseString], @"Call sign doesn't match: %@ <> %@", [qrzObj call], [callSign uppercaseString]);
}

@end
