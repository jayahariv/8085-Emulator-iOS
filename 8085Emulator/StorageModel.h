//
//  StorageModel.h
//  8085Emulator
//
//  Created by Jayahari V on 21/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parameter.h"

@interface StorageModel : Parameter


@property (nonatomic, strong) NSNumber * storageID;


- (id)init:(NSString*)title storageId:(int)storageId;

@end
