//
//  AddEvents.h
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Events : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtEvent;
@property (strong, nonatomic) IBOutlet UITextField *txtDescription;
@property (strong, nonatomic) IBOutlet UIDatePicker *dpFecha;
- (IBAction)btnSave:(id)sender;

@end
