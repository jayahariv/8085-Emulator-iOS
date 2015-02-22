//
//  InstructionProcessor.m
//  8085Emulator
//
//  Created by Jayahari V on 22/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import "InstructionProcessor.h"

@implementation InstructionProcessor

+ (void)MOV:(Parameter*)parameter1 paramater2:(Parameter*)paramater2 {
    parameter1.value = paramater2.value;
}
+ (void)ADD:(Parameter*)parameter1 paramater2:(Parameter*)paramater2 {
    parameter1.value = [NSNumber numberWithInt:[parameter1.value intValue]+[paramater2.value intValue]];
}
+ (void)MVI:(Parameter*)parameter1 paramater2:(Parameter*)paramater2 {
    parameter1.value = paramater2.value;
}
+ (void)SUB:(Parameter*)parameter1 paramater2:(Parameter*)paramater2 {
    parameter1.value = [NSNumber numberWithInt:[parameter1.value intValue]-[paramater2.value intValue]];
}
+ (void)MUL:(Parameter*)parameter1 paramater2:(Parameter*)paramater2 {
    parameter1.value = [NSNumber numberWithInt:[parameter1.value intValue]*[paramater2.value intValue]];
}

@end
