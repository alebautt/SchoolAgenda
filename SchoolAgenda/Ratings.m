//
//  addRatings.m
//  SchoolAgenda
//
//  Created by Alejandra B on 18/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Ratings.h"

@interface Ratings ()

@end

UIAlertView *alert;
NSString *alerta;
@implementation Ratings

@synthesize txtMateria;
@synthesize txtRating;
@synthesize txtNotes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) alertaRegistro{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message: alerta
                                      delegate:self
                             cancelButtonTitle:@"Ok"
                             otherButtonTitles:nil];
    [alert show];
}
-(void) SaveRatings{
    PFObject *object = [PFObject objectWithClassName:@"Ratings"];
    object[@"materia"] = self.txtMateria.text;
    object[@"calificacion"] = self.txtRating.text;
    object[@"notas"] = self.txtNotes.text;
    [object pinInBackground];
    if([object saveInBackground]){
        self.txtMateria.text = NULL;
        self.txtNotes.text = NULL;
        self.txtRating.text = NULL;
        alerta=@"Guardado correctamente";
    }
    else{
        alerta=@"algo ocurrio, no se pudo guardar :'( ";
    }
}


- (IBAction)txtMateriaSelec:(id)sender {
}

- (IBAction)btnSave:(id)sender {
    if([self.txtMateria.text isEqualToString:@""] || [self.txtRating.text isEqualToString:@""]){
        alerta=@"Verifica que hayas agregado una calificacion y materia";
        [self alertaRegistro];
    }
    else{
                    [self SaveRatings];
        [self alertaRegistro];
          }

}
@end
