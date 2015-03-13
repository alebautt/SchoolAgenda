//
//  Registro.h
//  SchoolAgenda
//
//  Created by Alejandra B on 12/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface addUser : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

//text
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtSchool;

//image
@property (strong, nonatomic) IBOutlet UIImageView *imgPhoto;

//buttons
- (IBAction)btnSave:(id)sender;
- (IBAction)btnCancel:(id)sender;
- (IBAction)btnFoto:(id)sender;
@end
