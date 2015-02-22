//
//  InstructionModel.m
//  8085Emulator
//
//  Created by Jayahari V on 21/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import "InstructionModel.h"

@implementation InstructionModel

- (id)init:(NSString*)title instructionId:(int)instructionId {
    self = [super init];
    if (self) {
        _title = title;
        _instructionID = [NSNumber numberWithInt:instructionId];
    }
    return self;
}

@end
