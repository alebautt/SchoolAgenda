//
//  addHorario.h
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Horario : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtMateria;
- (IBAction)txtDia:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *dpHora;
- (IBAction)btnSave:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtDia;
@property (strong, nonatomic) IBOutlet UITextField *txtAula;

@end
