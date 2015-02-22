//
//  ViewController.m
//  8085Emulator
//
//  Created by Jayahari V on 20/02/15.
//  Copyright (c) 2015 Jayahari V. All rights reserved.
//

#import "ViewController.h"
#import "Constant_8085.h"
#import "StorageModel.h"
#import "InstructionModel.h"
#import "ValueModel.h"
#import "InstructionProcessor.h"

@interface ViewController ()

//Storage area
@property (strong, nonatomic) IBOutlet UILabel *A_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *B_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *C_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *D_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *E_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *H_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *I_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *BC_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *DE_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *HI_Register_Label;
@property (strong, nonatomic) IBOutlet UILabel *SP_Label;
@property (strong, nonatomic) IBOutlet UILabel *PC_Label;


// Instruction area
@property (strong, nonatomic) IBOutlet UIPickerView *instruction_Picker;

@property (strong, nonatomic) NSArray * instructions; // instructions
@property (strong, nonatomic) NSArray * storages; // contains the registers, pc and sp names
@property (strong, nonatomic) NSArray * values; // this will contain the hexa-deciaml names

@property (assign, nonatomic) BOOL isValue; // this will be YES, when the parameter 2 needs to be shown with respect to the values which we supply.


@property (nonatomic, strong) InstructionModel * currentInstruction;
@property (nonatomic, strong) Parameter * currentParameter1;
@property (nonatomic, strong) Parameter * currentParameter2;

@end

@implementation ViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self populateStorages];
    [self populateInstructions];
    [self populateValues];
    [self initMisc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Initializers
- (void)initMisc {
    self.isValue = NO;// initialize with NO. 'first instrcution is MOV'
    self.currentInstruction = [self.instructions firstObject];
    self.currentParameter1 = [self.storages firstObject];
    self.currentParameter2 = [self.storages firstObject];
}
- (void)populateStorages {
    
    // create the list of storage items
    NSMutableArray * storageList = [[NSMutableArray alloc] init];
    
    StorageModel * A_regster = [[StorageModel alloc] init:@"A" storageId:A_REGISTER_STORAGEID];
    [storageList addObject:A_regster];

    StorageModel * B_regster = [[StorageModel alloc] init:@"B" storageId:B_REGISTER_STORAGEID];
    [storageList addObject:B_regster];

    StorageModel * C_regster = [[StorageModel alloc] init:@"C" storageId:C_REGISTER_STORAGEID];
    [storageList addObject:C_regster];

    StorageModel * D_regster = [[StorageModel alloc] init:@"D" storageId:D_REGISTER_STORAGEID];
    [storageList addObject:D_regster];

    StorageModel * E_regster = [[StorageModel alloc] init:@"E" storageId:E_REGISTER_STORAGEID];
    [storageList addObject:E_regster];

    StorageModel * H_regster = [[StorageModel alloc] init:@"H" storageId:H_REGISTER_STORAGEID];
    [storageList addObject:H_regster];

    StorageModel * I_regster = [[StorageModel alloc] init:@"I" storageId:I_REGISTER_STORAGEID];
    [storageList addObject:I_regster];

    StorageModel * BC_regster = [[StorageModel alloc] init:@"BC" storageId:BC_REGISTER_STORAGEID];
    [storageList addObject:BC_regster];

    StorageModel * DE_regster = [[StorageModel alloc] init:@"DE" storageId:DE_REGISTER_STORAGEID];
    [storageList addObject:DE_regster];

    StorageModel * HI_regster = [[StorageModel alloc] init:@"HI" storageId:HI_REGISTER_STORAGEID];
    [storageList addObject:HI_regster];

    StorageModel * sp = [[StorageModel alloc] init:@"SP" storageId:SP_REGISTER_STORAGEID];
    [storageList addObject:sp];

    StorageModel * pc = [[StorageModel alloc] init:@"PC" storageId:PC_REGISTER_STORAGEID];
    [storageList addObject:pc];

    self.storages = [NSArray arrayWithArray:storageList];
}

- (void)populateInstructions {

    NSMutableArray * instructionList = [[NSMutableArray alloc] init];
    
    InstructionModel * mov = [[InstructionModel alloc] init:@"MOV" instructionId:MOV_INSTRUCTION_ID];
    [instructionList addObject:mov];
    
    InstructionModel * add = [[InstructionModel alloc] init:@"ADD" instructionId:ADD_INSTRUCTION_ID];
    [instructionList addObject:add];
    
    InstructionModel * mvi = [[InstructionModel alloc] init:@"MVI" instructionId:MVI_INSTRUCTION_ID];
    [instructionList addObject:mvi];
    
    InstructionModel * sub = [[InstructionModel alloc] init:@"SUB" instructionId:SUB_INSTRUCTION_ID];
    [instructionList addObject:sub];
    
    InstructionModel * mul = [[InstructionModel alloc] init:@"MUL" instructionId:MUL_INSTRUCTION_ID];
    [instructionList addObject:mul];
    
    self.instructions = [NSArray arrayWithArray:instructionList];
}

- (void)populateValues {
    NSMutableArray * valuesList = [[NSMutableArray alloc] init];
    
    ValueModel * zero = [[ValueModel alloc] init:0];
    [valuesList addObject:zero];
    
    ValueModel * one = [[ValueModel alloc] init:1];
    [valuesList addObject:one];

    ValueModel * two = [[ValueModel alloc] init:2];
    [valuesList addObject:two];

    ValueModel * three = [[ValueModel alloc] init:3];
    [valuesList addObject:three];

    ValueModel * four = [[ValueModel alloc] init:4];
    [valuesList addObject:four];

    ValueModel * five = [[ValueModel alloc] init:5];
    [valuesList addObject:five];

    ValueModel * six = [[ValueModel alloc] init:6];
    [valuesList addObject:six];

    ValueModel * seven = [[ValueModel alloc] init:7];
    [valuesList addObject:seven];

    ValueModel * eight = [[ValueModel alloc] init:8];
    [valuesList addObject:eight];

    ValueModel * nine = [[ValueModel alloc] init:9];
    [valuesList addObject:nine];
    
    ValueModel * ten = [[ValueModel alloc] init:10];
    [valuesList addObject:ten];

    
    ValueModel * elevan = [[ValueModel alloc] init:11];
    [valuesList addObject:elevan];

    
    ValueModel * twelve = [[ValueModel alloc] init:12];
    [valuesList addObject:twelve];

    
    ValueModel * thirteen = [[ValueModel alloc] init:13];
    [valuesList addObject:thirteen];

    ValueModel * fourteen = [[ValueModel alloc] init:14];
    [valuesList addObject:fourteen];

    ValueModel * fifteen = [[ValueModel alloc] init:15];
    [valuesList addObject:fifteen];

    ValueModel * sixteen = [[ValueModel alloc] init:16];
    [valuesList addObject:sixteen];


    self.values = [NSArray arrayWithArray:valuesList];
}

#pragma mark - Picker delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    NSInteger numberOfComponents = 3;
    return numberOfComponents;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger numberOfRows = 0;
    switch (component) {
        case 0: {
            // INSTRUCTION AREA
            numberOfRows = 5;
        }
            break;
        case 1: {
            // PARAMETER 1
            numberOfRows = 12;
        }
            break;
        case 2: {
            // PARAMETER 2
            if (self.isValue) {
                numberOfRows = 17;
            }
            else {
                numberOfRows = 12;
            }
            
        }
            break;
        default:{
            
            // SOMETHING HAPPENS WRONG
            numberOfRows = 1;
        }
            break;
    }
    return numberOfRows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    switch (component) {
        case 0: {
            // INSTRUCTION AREA
            InstructionModel * model = [self.instructions objectAtIndex:row];
            title = model.title;
        }
            break;
        case 1: {
            // PARAMETER 1
            StorageModel * model = [self.storages objectAtIndex:row];
            title = model.title;
            
        }
            break;
        case 2: {
            
            
            // PARAMETER 2
            if (self.isValue) {
                ValueModel * model = [self.values objectAtIndex:row];
                title = model.title;
            }
            else {
                StorageModel * model = [self.storages objectAtIndex:row];
                title = model.title;
            }
        }
            break;
        default:{
            
            // SOMETHING HAPPENS WRONG

        }
            break;
    }
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0: {
            // INSTRUCTIONS
            self.currentInstruction = [self.instructions objectAtIndex:row];
            if (row==2) {
                self.isValue = YES;
            }
            else {
                self.isValue = NO;
            }
            [self updateCurrentValue];
            [pickerView reloadAllComponents];
        }
            break;
        case 1: {
            // PARAMATER 1
            self.currentParameter1 = [self.storages objectAtIndex:row];
        }
            break;
        case 2: {
            if (self.isValue) {
                self.currentParameter2 = [self.values objectAtIndex:row];
            }
            else {
                self.currentParameter2 = [self.storages objectAtIndex:row];
            }
        }
            break;
        default:{
            
        }
            break;
    }
}


#pragma mark - Helper methods
- (void)updateCurrentValue {
    NSInteger row = [self.instruction_Picker selectedRowInComponent:2];
    if (self.isValue) {
        self.currentParameter2 = [self.values objectAtIndex:row];
    }
    else {
        self.currentParameter2 = [self.storages objectAtIndex:row];
    }
}

- (void)updateStorageValuesOnScreen {
    
    NSString * paramater1ValueString = [NSString stringWithFormat:@"%@ -> %@", self.currentParameter1.title, self.currentParameter1.value.stringValue];
    switch (self.currentParameter1.paramaterId.intValue) {
        case A_REGISTER_STORAGEID:
        {
            self.A_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case B_REGISTER_STORAGEID:
        {
            self.B_Register_Label.text = paramater1ValueString;
        }
            break;
        case C_REGISTER_STORAGEID:
        {
            self.C_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case D_REGISTER_STORAGEID:
        {
            self.D_Register_Label.text = paramater1ValueString;
        }
            break;
        case E_REGISTER_STORAGEID:
        {
            self.E_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case H_REGISTER_STORAGEID:
        {
            self.H_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case I_REGISTER_STORAGEID:
        {
            self.I_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case BC_REGISTER_STORAGEID:
        {
            self.BC_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case DE_REGISTER_STORAGEID:
        {
            self.DE_Register_Label.text = paramater1ValueString;
        }
            break;
        case HI_REGISTER_STORAGEID:
        {
            self.HI_Register_Label.text = paramater1ValueString;
        }
            break;
        case SP_REGISTER_STORAGEID:
        {
            self.SP_Label.text = paramater1ValueString;
        }
            break;
            
        case PC_REGISTER_STORAGEID:
        {
            self.PC_Label.text = paramater1ValueString;
        }
            break;
            
        default:
            break;
    }
    
    paramater1ValueString = [NSString stringWithFormat:@"%@ -> %@", self.currentParameter2.title, self.currentParameter2.value.stringValue];
    switch (self.currentParameter2.paramaterId.intValue) {
        case A_REGISTER_STORAGEID:
        {
            self.A_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case B_REGISTER_STORAGEID:
        {
            self.B_Register_Label.text = paramater1ValueString;
        }
            break;
        case C_REGISTER_STORAGEID:
        {
            self.C_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case D_REGISTER_STORAGEID:
        {
            self.D_Register_Label.text = paramater1ValueString;
        }
            break;
        case E_REGISTER_STORAGEID:
        {
            self.E_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case H_REGISTER_STORAGEID:
        {
            self.H_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case I_REGISTER_STORAGEID:
        {
            self.I_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case BC_REGISTER_STORAGEID:
        {
            self.BC_Register_Label.text = paramater1ValueString;
        }
            break;
            
        case DE_REGISTER_STORAGEID:
        {
            self.DE_Register_Label.text = paramater1ValueString;
        }
            break;
        case HI_REGISTER_STORAGEID:
        {
            self.HI_Register_Label.text = paramater1ValueString;
        }
            break;
        case SP_REGISTER_STORAGEID:
        {
            self.SP_Label.text = paramater1ValueString;
        }
            break;
            
        case PC_REGISTER_STORAGEID:
        {
            self.PC_Label.text = paramater1ValueString;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Button Actions
- (IBAction)onTouchUpExecute:(id)sender {
    NSLog(@"Instruction: %@ %@, %@", self.currentInstruction.title, self.currentParameter1.title, self.currentParameter2.title);
    
    switch (self.currentInstruction.instructionID.intValue) {
        case MOV_INSTRUCTION_ID:
        {
            [InstructionProcessor MOV:self.currentParameter1 paramater2:self.currentParameter2];
        }
            break;
            
        case MVI_INSTRUCTION_ID: {
            [InstructionProcessor MVI:self.currentParameter1 paramater2:self.currentParameter2];
        }
            break;
            
        case ADD_INSTRUCTION_ID: {
            [InstructionProcessor ADD:self.currentParameter1 paramater2:self.currentParameter2];
        }
            break;
            
        case SUB_INSTRUCTION_ID: {
            [InstructionProcessor SUB:self.currentParameter1 paramater2:self.currentParameter2];
        }
            break;
            
        case MUL_INSTRUCTION_ID: {
            [InstructionProcessor MUL:self.currentParameter1 paramater2:self.currentParameter2];
        }
            break;
        default:
            break;
    }
    [self updateStorageValuesOnScreen];
}



@end
