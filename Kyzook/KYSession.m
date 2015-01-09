//
//  KYSession.m
//  Kyzook
//
//  Created by Sudhi.S on 06/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYSession.h"

@implementation KYSession

+(KYSession*)sharedInstance
{
    static KYSession *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[KYSession alloc] init];
    });
    return _sharedInstance;
}
@end
