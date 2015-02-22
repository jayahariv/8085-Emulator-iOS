//
//  InstructionProcessor.h
//  8085Emulator
//
//  Created by Jayahari V on 22/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parameter.h"

@interface InstructionProcessor : NSObject

+ (void)MOV:(Parameter*)parameter1 paramater2:(Parameter*)paramater2;
+ (void)ADD:(Parameter*)parameter1 paramater2:(Parameter*)paramater2;
+ (void)MVI:(Parameter*)parameter1 paramater2:(Parameter*)paramater2;
+ (void)SUB:(Parameter*)parameter1 paramater2:(Parameter*)paramater2;
+ (void)MUL:(Parameter*)parameter1 paramater2:(Parameter*)paramater2;

@end
