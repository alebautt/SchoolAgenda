//
//  addHorario.m
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Horario.h"
#import "varGlobal.h"
UIAlertView     *alert;
NSString *alerta;
@interface Horario ()

@end

@implementation Horario

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) AlertDia{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Selecciona un dia de la semana"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Lunes", @"Martes",@"Miercoles",@"Jueves",@"Viernes",@"Sabado",@"Domingo", nil];
                                      [alert show];
    

}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // self.txtMateria.text = [[alerta tx:0] text];
    
    
    
   // NSLog(@"%ld esto es butto",o);
    
    }


- (IBAction)txtDia:(id)sender {
      [self AlertDia];
  }

- (IBAction)btnSave:(id)sender {
    
    if([self.txtDia.text isEqualToString:@""] || [self.txtMateria.text isEqualToString:@""]){
        alerta=@"Verifica que hayas ingresado un horario";
        [self alertaRegistro];
    }else{
        [self SaveHorario];
        [self alertaRegistro];
    }
}

-(void) alertaRegistro{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message: alerta
                                      delegate:self
                             cancelButtonTitle:@"Ok"
                             otherButtonTitles:nil];
    [alert show];
}

-(void) SaveHorario{
    PFObject *object = [PFObject objectWithClassName:@"horario"];
    object[@"dia"] = self.txtDia.text;
    object[@"materia"] = self.txtMateria.text;
    object[@"hora"] = self.dpHora.date;
    object[@"aula"] = self.txtAula.text;
    [object pinInBackground];
    if([object saveInBackground]){
        self.txtMateria.text = NULL;
        self.txtDia.text = NULL;
        self.txtAula.text = NULL;
        alerta=@"Guardado correctamente";
    }
}
@end
