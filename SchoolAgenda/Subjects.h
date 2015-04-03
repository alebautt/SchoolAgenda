//
//  addSubjects.h
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface Subjects : UIViewController

//text
@property (strong, nonatomic) IBOutlet UITextField *txtSubjects;
@property (strong, nonatomic) IBOutlet UITextField *txtNameTeach;

//buttons
- (IBAction)btnSave:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblSave;

@end
