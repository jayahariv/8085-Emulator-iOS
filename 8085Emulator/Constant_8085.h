//
//  Constant_8085.h
//  8085Emulator
//
//  Created by Jayahari V on 21/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import <Foundation/Foundation.h>

//********** STORAGE IDs *********************** //

static int const A_REGISTER_STORAGEID = 100;
static int const B_REGISTER_STORAGEID = 101;
static int const C_REGISTER_STORAGEID = 102;
static int const D_REGISTER_STORAGEID = 103;
static int const E_REGISTER_STORAGEID = 104;
static int const H_REGISTER_STORAGEID = 105;
static int const I_REGISTER_STORAGEID = 106;
static int const BC_REGISTER_STORAGEID = 107;
static int const DE_REGISTER_STORAGEID = 108;
static int const HI_REGISTER_STORAGEID = 109;
static int const SP_REGISTER_STORAGEID = 110;
static int const PC_REGISTER_STORAGEID = 111;

//********** INSTRUCTION IDs *********************** //

static int const MOV_INSTRUCTION_ID = 200;
static int const MVI_INSTRUCTION_ID = 201;
static int const ADD_INSTRUCTION_ID = 202;
static int const SUB_INSTRUCTION_ID = 203;
static int const MUL_INSTRUCTION_ID = 204;