//
//  Parameter.m
//  8085Emulator
//
//  Created by Jayahari V on 22/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import "Parameter.h"

@implementation Parameter


- (id)init {
    self = [super init];
    if (self) {
        _value = [NSNumber numberWithInt:0];
    }
    return self;
}

@end
