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
    [self setDelegate];
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
    [self.lblYourDetail setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:10.0f]];
    [self.lblDeliveryAddr setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:10.0f]];
    [self.lblCount setFont:[UIFont fontWithName:@"Aleo-Regular" size:14.0f]];
    [self.lblPaymentDetail setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:10.0f]];
    [self.lblYourOrder setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:10.0f]];
    [self.lblTotalPrice setFont:[UIFont fontWithName:@"Franklin Gothic Medium" size:10.0f]];
    [self.lblGarmName1 setFont:[UIFont fontWithName:@"Aleo-Regular" size:22.0f]];
    [self.lblTotalPriceValue setFont:[UIFont fontWithName:@"Aleo-Regular" size:35.0f]];
    [self.lblGarmSIze setFont:[UIFont fontWithName:@"Aleo-Regular" size:22.0f]];
    [self.lblFindAddr setFont:[UIFont fontWithName:@"Aleo-Regular" size:17.0f]];
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
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    [textField becomeFirstResponder];
//    return YES;
//}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.txtEmailAddr)
    {
        if([self validateEmail:textField.text])
        {
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 15)];
            [textField resignFirstResponder];
            [self.txtMobileNumber becomeFirstResponder];
        }
        else
        {
            [self alert:@"Email address format is not correct"];
            textField.text = @"";
        }
    }
    else if(textField == self.txtMobileNumber)
    {
        
        if([self validateNumber:textField.text])
        {
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 88)];
            [textField resignFirstResponder];
            [self.txtFirstName becomeFirstResponder];
        }
        else
        {
            [self alert:@"Only numbers can be used."];
            textField.text = @"";
        }
        
    }
    else if(textField == self.txtFirstName)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 42)];
        [textField resignFirstResponder];
        [self.txtLastName becomeFirstResponder];
    }
    else if(textField == self.txtLastName)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 55)];
        [textField resignFirstResponder];
        [self.txtPostcode becomeFirstResponder];
    }
    else if(textField == self.txtPostcode)
    {
        if([self validateNumber:textField.text])
        {
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 60)];
            [textField resignFirstResponder];
            [self.txtHouseName becomeFirstResponder];
        }
        else
        {
            [self alert:@"Only numbers can be used."];
            textField.text = @"";
        }
    }
    else if(textField == self.txtHouseName)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
        [textField resignFirstResponder];
        [self.txtCardNumber becomeFirstResponder];
    }
    else if(textField == self.txtCardNumber)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 48)];
        [textField resignFirstResponder];
        [self.txtAddressLine becomeFirstResponder];
    }
    else if(textField == self.txtAddressLine)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
        [textField resignFirstResponder];
        [self.txtTowmn becomeFirstResponder];
    }
    else if(textField == self.txtTowmn)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
        [textField resignFirstResponder];
        [self.txtCountry becomeFirstResponder];
    }
    else if(textField == self.txtCountry)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
        [textField resignFirstResponder];
        [self.txtPostcode1 becomeFirstResponder];
    }
    else if(textField == self.txtPostcode1)
    {
        if([self validateNumber:textField.text])
        {
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 95)];
            [textField resignFirstResponder];
            [self.txtNameOnCard becomeFirstResponder];
        }
        else
        {
            [self alert:@"Only numbers can be used."];
            textField.text = @"";
        }
    }
    else if(textField == self.txtNameOnCard)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
        [textField resignFirstResponder];
        [self.CardNumber becomeFirstResponder];
    }
    else if(textField == self.CardNumber)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
        [textField resignFirstResponder];
        [self.txtExpiryDate becomeFirstResponder];
    }
    else if(textField == self.txtExpiryDate)
    {
        if([self validateDate:textField.text])
        {
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 45)];
            [textField resignFirstResponder];
            [self.txtCCV becomeFirstResponder];
        }
        else
        {
            [self alert:@"Date format is not correct."];
            textField.text = @"";
        }
    }
    else if(textField == self.txtCCV)
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + 10)];
        [textField resignFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    return YES;
}
#pragma validate 
- (BOOL)validateEmail:(NSString*)emailAddr
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    return [emailTest evaluateWithObject:emailAddr];
}
- (BOOL)validateNumber:(NSString*)num
{
    NSString *expression = @"^([0-9]+)?(\\.([0-9]{1,2})?)?$";
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    
    return [numTest evaluateWithObject:num];
}
- (BOOL)validateDate:(NSString*)date
{
    //yyyy-mm-dd format
    NSString *dateRegEx1 = @"^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$";
    
    NSPredicate *dateTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dateRegEx1];
    
    return [dateTest1 evaluateWithObject:date];
    
    
}
- (void)alert:(NSString*)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}
#pragma Button Actions
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

- (IBAction)btnFindAddr:(id)sender {
}

@end
