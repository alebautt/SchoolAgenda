//
//  cellAgenda.h
//  SchoolAgenda
//
//  Created by Alejandra B on 11/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>

//home
@interface cellAgenda : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgMenu;
@property (strong, nonatomic) IBOutlet UILabel *lblMenu;
@property (strong, nonatomic) IBOutlet UIView *vCell;

//ListSubjects

@property (strong, nonatomic) IBOutlet UIView *cellSubj;
@property (strong, nonatomic) IBOutlet UILabel *lblSubject;

//listEvents

@property (strong, nonatomic) IBOutlet UILabel *txtEvent;
@property (strong, nonatomic) IBOutlet UILabel *txtDate;
@property (strong, nonatomic) IBOutlet UILabel *txtDesc;
@property (strong, nonatomic) IBOutlet UIImageView *imgStatus;


//ListRatings
@property (strong, nonatomic) IBOutlet UILabel *txtMateri;

@property (strong, nonatomic) IBOutlet UILabel *txtCal;

//ListHorario
//Hora
@property (strong, nonatomic) IBOutlet UILabel *lblFDomingo;
@property (strong, nonatomic) IBOutlet UILabel *lblFLunes;
@property (strong, nonatomic) IBOutlet UILabel *lblFMartes;
@property (strong, nonatomic) IBOutlet UILabel *lblFMiercoles;
@property (strong, nonatomic) IBOutlet UILabel *lblFJueves;
@property (strong, nonatomic) IBOutlet UILabel *lblFViernes;
@property (strong, nonatomic) IBOutlet UILabel *lblFSabado;
//ListHorario
//Materia
@property (strong, nonatomic) IBOutlet UILabel *lblMDom;
@property (strong, nonatomic) IBOutlet UILabel *lblMLun;
@property (strong, nonatomic) IBOutlet UILabel *lblMMar;
@property (strong, nonatomic) IBOutlet UILabel *lblMMie;
@property (strong, nonatomic) IBOutlet UILabel *lblMJue;
@property (strong, nonatomic) IBOutlet UILabel *lblMVie;
@property (strong, nonatomic) IBOutlet UILabel *lblMSab;

@end
