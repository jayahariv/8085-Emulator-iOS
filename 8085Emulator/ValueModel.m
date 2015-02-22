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
        self.value = [NSNumber numberWithInt:valueInt];
        self.isStorage = NO;
        self.title = [NSString stringWithFormat:@"0x%02x", (unsigned int)[self.value intValue]];
    }
    return self;
}

@end
