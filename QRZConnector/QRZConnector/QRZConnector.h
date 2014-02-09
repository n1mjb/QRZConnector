//
//  QRZConnector.h
//  QRZConnector
//
//  Created by Matthew on 2/8/14.
//  Copyright (c) 2014 N1MJB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QRZConnector : NSObject<NSXMLParserDelegate>
{
@private
    NSMutableDictionary *elements;
    NSMutableString *recorderString;
    NSString *currentElement;
    NSString *qrzKey;
}

-(id)initWithUserName:(NSString *)username andPassword:(NSString *)password;
-(NSMutableDictionary *)getQRZData:(NSString *)callSign;
@end
