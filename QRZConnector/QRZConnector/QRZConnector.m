//
//  QRZConnector.m
//  QRZConnector
//
//  Created by Matthew on 2/8/14.
//  Copyright (c) 2014 Matthew J Beauchesne. All rights reserved.
//

#import "QRZConnector.h"

@implementation QRZConnector

-(id) initWithUserName:(NSString *)username andPassword:(NSString *)password
{
    // Create initial connection to QRZ.com to login and get our key.
    qrzKey = @"";
    NSURL *remoteTextFileURL = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://xmldata.qrz.com/xml/current/?username=%@;password=%@;agent=MJBObjCTest", username, password]];
    NSData *remoteTextFileData = [NSData dataWithContentsOfURL:remoteTextFileURL];
    [remoteTextFileData writeToFile:@"/Users/mjb/code-test.txt" atomically:YES];
    
    // We'll need to parse the XML to get the key.
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:remoteTextFileData];
    xmlParser.delegate = self;
    [xmlParser parse];
    
    return [self init];
}

-(void)     parser:(NSXMLParser *)parser
   didStartElement:(NSString *)elementName
      namespaceURI:(NSString *)namespaceURI
     qualifiedName:(NSString *)qName
        attributes:(NSDictionary *)attributeDict
{
    currentElement = [elementName copy];
    if ([elementName isEqualToString:@"call"]) {
        recorderString = [[NSMutableString alloc] init];
    }
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([string isNotEqualTo:@"\n"]) {
        if ([currentElement isEqualToString:@"Key"]) {
            qrzKey = string;
        } else {
            [elements setObject:string forKey:currentElement];
        }
    }
}

-(NSMutableDictionary *) getQRZData:(NSString *)callSign
{
    // Set up the dictionary to hold the QRZ XML elements.
    elements = [[NSMutableDictionary alloc] init];
    
    // Create our request string using our provided key and call sign.
    NSString *requestString = [[NSString alloc] initWithFormat:@"http://xmldata.qrz.com/xml/current/?s=%@;callsign=%@", qrzKey, callSign];
    
    // Send the reqeust to QRZ.com.
    NSURL *requestURL = [NSURL URLWithString:requestString];
    recorderString = nil;
    NSData *responseData = [NSData dataWithContentsOfURL:requestURL];
    
    // Parse the resulting XML.
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:responseData];
    xmlParser.delegate = self;
    [xmlParser parse];
    
    if (recorderString)
        return elements;
    else
        return nil;
}


@end
