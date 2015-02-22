//
//  StorageModel.m
//  8085Emulator
//
//  Created by Jayahari V on 21/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import "StorageModel.h"

@implementation StorageModel


- (id)init:(NSString*)title storageId:(int)storageId {
    self = [super init];
    if (self) {
        self.title = title;
        _storageID = [NSNumber numberWithInt:storageId];
        self.isStorage = YES;
    }
    return self;
}

@end
