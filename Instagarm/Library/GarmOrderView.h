//
//  GarmOrderView.h
//  Instagarm
//
//  Created by AlexWang on 3/8/14.
//  Copyright (c) 2014 2wodigits. All rights reserved.
//

#import <UIKit/UIKit.h>

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
@property (weak, nonatomic) IBOutlet UILabel *lblEmailAddr;
@property (weak, nonatomic) IBOutlet UILabel *lblMobileNum;
@property (weak, nonatomic) IBOutlet UILabel *lblDeliveryAddr;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblPostCode;
@property (weak, nonatomic) IBOutlet UILabel *lblHouseName;
@property (weak, nonatomic) IBOutlet UILabel *lblCardNum;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblTown;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;
@property (weak, nonatomic) IBOutlet UILabel *lblPostcode1;
@property (weak, nonatomic) IBOutlet UILabel *lblPaymentDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblNameOnCard;
@property (weak, nonatomic) IBOutlet UILabel *lblCardNum1;
@property (weak, nonatomic) IBOutlet UILabel *lblExpireDate;
@property (weak, nonatomic) IBOutlet UILabel *lblCCV;
@property (weak, nonatomic) IBOutlet UILabel *lblYourOrder;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblGarmName1;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalPriceValue;
@property (weak, nonatomic) IBOutlet UILabel *lblGarmSIze;


@property (weak, nonatomic) IBOutlet UITextField *txtEmailAddr;
@property (weak, nonatomic) IBOutlet UITextField *txtMobileNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtPostcode;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtHouseName;
@property (weak, nonatomic) IBOutlet UITextField *txtCardNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtAddressLine;
@property (weak, nonatomic) IBOutlet UITextField *txtTowmn;
@property (weak, nonatomic) IBOutlet UITextField *txtCountry;
@property (weak, nonatomic) IBOutlet UITextField *txtNameOnCard;
@property (weak, nonatomic) IBOutlet UITextField *txtPostcode1;
@property (weak, nonatomic) IBOutlet UITextField *CardNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtExpiryDate;
@property (weak, nonatomic) IBOutlet UITextField *txtCCV;


@property (nonatomic) NSInteger countGarm;

-(void)initInterface;
- (IBAction)btnMinus:(id)sender;
- (IBAction)btnPlus:(id)sender;
- (IBAction)btnSendToPrint:(id)sender;

@end
