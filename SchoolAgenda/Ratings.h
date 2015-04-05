//
//  addRatings.h
//  SchoolAgenda
//
//  Created by Alejandra B on 18/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Ratings : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *txtRating;

@property (strong, nonatomic) IBOutlet UITextField *txtNotes;

@property (strong, nonatomic) IBOutlet UITextField *txtMateria;
- (IBAction)txtMateriaSelec:(id)sender;
- (IBAction)btnSave:(id)sender;

@end
