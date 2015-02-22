//
//  ValueModel.m
//  8085Emulator
//
//  Created by Jayahari V on 21/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import "ValueModel.h"

@implementation ValueModel

- (id)init:(int)valueInt {
    self = [super init];
    if (self) {
        _value = [NSNumber numberWithInt:valueInt];
        self.isStorage = NO;
        self.title = [NSString stringWithFormat:@"0x%02x", (unsigned int)[_value intValue]];
    }
    return self;
}

@end
