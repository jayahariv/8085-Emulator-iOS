//
//  InstructionModel.h
//  8085Emulator
//
//  Created by Jayahari V on 21/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parameter.h"


@interface InstructionModel : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSNumber * instructionID;

- (id)init:(NSString*)title instructionId:(int)instructionId;

@end
