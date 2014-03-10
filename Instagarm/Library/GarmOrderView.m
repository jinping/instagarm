//
//  GarmOrderView.m
//  Instagarm
//
//  Created by AlexWang on 3/8/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import "GarmOrderView.h"

@implementation GarmOrderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)initInterface
{
    [self setLabelProperties];
    self.countGarm = 1;
}
- (void)setLabelProperties
{
    [self.lblGarmTitle setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblGarmQTY setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblGarmName setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblCount setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblSize setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblChange setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblPrice setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblSizeName setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblPriceValue setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblYourDetail setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblEmailAddr setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblMobileNum setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblDeliveryAddr setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblFirstName setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblLastName setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblPostCode setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblHouseName setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblCardNum setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblAddress setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblTown setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblCount setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblPostcode1 setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblPaymentDetail setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblNameOnCard setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblCardNum1 setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblExpireDate setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblCCV setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblYourOrder setFont:[UIFont fontWithName:@"Franklin Gthic Medium" size:9.0f]];
    [self.lblTotalPrice setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:9.0f]];
    [self.lblGarmName1 setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    [self.lblTotalPriceValue setFont:[UIFont fontWithName:@"Aleo-Regular" size:20.0f]];
    [self.lblGarmSIze setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
    
    
}
- (void)setDelegate
{
    self.txtEmailAddr.delegate = self;
    self.txtMobileNumber.delegate = self;
    self.txtFirstName.delegate = self;
    self.txtLastName.delegate = self;
    self.txtPostcode.delegate = self;
    self.txtHouseName.delegate = self;
    self.txtCardNumber.delegate = self;
    self.txtAddressLine.delegate = self;
    self.txtTowmn.delegate = self;
    self.txtCountry.delegate = self;
    self.txtNameOnCard.delegate = self;
    self.txtPostcode1.delegate = self;
    self.CardNumber.delegate = self;
    self.txtExpiryDate.delegate = self;
    self.txtCCV.delegate = self;
    
}
#pragma UITextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)btnMinus:(id)sender
{
    if(self.countGarm == 1)
        return;
    self.countGarm--;
    self.lblCount.text = [NSString stringWithFormat:@"%d", self.countGarm];
}

- (IBAction)btnPlus:(id)sender
{
    self.countGarm++;
    self.lblCount.text = [NSString stringWithFormat:@"%d", self.countGarm];
    
    
}

- (IBAction)btnSendToPrint:(id)sender {
}

@end
