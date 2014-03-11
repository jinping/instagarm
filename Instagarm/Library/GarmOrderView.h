//
//  GarmOrderView.h
//  Instagarm
//
//  Created by AlexWang on 3/8/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextField.h"

@interface GarmOrderView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblGarmTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblGarmQTY;
@property (weak, nonatomic) IBOutlet UILabel *lblGarmName;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;
@property (weak, nonatomic) IBOutlet UILabel *lblSize;
@property (weak, nonatomic) IBOutlet UILabel *lblChange;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblSizeName;
@property (weak, nonatomic) IBOutlet UILabel *lblPriceValue;
@property (weak, nonatomic) IBOutlet UILabel *lblYourDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblDeliveryAddr;
@property (weak, nonatomic) IBOutlet UILabel *lblPaymentDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblYourOrder;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblGarmName1;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalPriceValue;
@property (weak, nonatomic) IBOutlet UILabel *lblGarmSIze;
@property (weak, nonatomic) IBOutlet UIButton *btnFindAddr;

@property (weak, nonatomic) IBOutlet UILabel *lblFindAddr;

@property (weak, nonatomic) IBOutlet MyTextField *txtEmailAddr;
@property (weak, nonatomic) IBOutlet MyTextField *txtMobileNumber;
@property (weak, nonatomic) IBOutlet MyTextField *txtFirstName;
@property (weak, nonatomic) IBOutlet MyTextField *txtPostcode;
@property (weak, nonatomic) IBOutlet MyTextField *txtLastName;
@property (weak, nonatomic) IBOutlet MyTextField *txtHouseName;
@property (weak, nonatomic) IBOutlet MyTextField *txtCardNumber;
@property (weak, nonatomic) IBOutlet MyTextField *txtAddressLine;
@property (weak, nonatomic) IBOutlet MyTextField *txtTowmn;
@property (weak, nonatomic) IBOutlet MyTextField *txtCountry;
@property (weak, nonatomic) IBOutlet MyTextField *txtNameOnCard;
@property (weak, nonatomic) IBOutlet MyTextField *txtPostcode1;
@property (weak, nonatomic) IBOutlet MyTextField *CardNumber;
@property (weak, nonatomic) IBOutlet MyTextField *txtExpiryDate;
@property (weak, nonatomic) IBOutlet MyTextField *txtCCV;


@property (nonatomic) NSInteger countGarm;
@property (strong, nonatomic) UIScrollView *scrollView;

-(void)initInterface;
- (IBAction)btnMinus:(id)sender;
- (IBAction)btnPlus:(id)sender;
- (IBAction)btnSendToPrint:(id)sender;
- (IBAction)btnFindAddr:(id)sender;

@end
