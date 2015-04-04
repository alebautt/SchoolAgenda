//
//  addSubjects.m
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Subjects.h"
#import "varGlobal.h"

UIAlertView *alert;
NSString *alerta;
@interface Subjects ()
@end

@implementation Subjects

@synthesize txtNameTeach;
@synthesize txtSubjects;

- (void)viewDidLoad {
     [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(flagSub == 0)//agregar materia
    {
        self.lblSave.text=@"Guardar";
        NSLog(@"Guardar");
     //   objectId = @"";
        
    }
   else if(flagSub == 1)//editar
    {
        self.txtSubjects.text=SubjName;
        self.txtNameTeach.text=SubjTeacher;
        self.lblSave.text =@"Modificar";
        NSLog(@"Modificar");

    }
}

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    
    if([self.txtSubjects.text isEqualToString:@""]){
      alerta=@"Verifica que hayas ingresado una materia";
        [self alertaRegistro];
    }
    else{
        
        if(flagSub == 0)  //add
        {
            [self SaveSubject];
        }
        else if(flagSub == 1)//edit
        {
            [self EditSubject];
        }
        [self alertaRegistro];
     // self.txtSubjects.text = nil;
       // self.txtNameTeach.text = nil;
     }
}

-(void) SaveSubject{
    PFObject *object = [PFObject objectWithClassName:@"Subjects"];
    object[@"subject"] = self.txtSubjects.text;
    object[@"teacher"] = self.txtNameTeach.text;
    [object pinInBackground];
    if([object saveInBackground]){
        self.txtSubjects.text = NULL;
        self.txtNameTeach.text = NULL;
         alerta=@"Guardado correctamente";
    }
    else{
        alerta=@"algo ocurrio, no se pudo guardar :'( ";
    }
    
}

-(void) EditSubject{
    PFQuery *query = [PFQuery queryWithClassName:@"Subjects"];
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *subj, NSError *error) {
        subj[@"subject"] = self.txtSubjects.text;
        subj[@"teacher"] = self.txtNameTeach.text;
        [subj pinInBackground];
        //[subj saveInBackground];
        if([subj saveInBackground]){
            self.txtSubjects.text = nil;
             self.txtNameTeach.text = nil;
        }
    }];
     alerta=@"modificado correctamente";
}

-(void) alertaRegistro{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message: alerta
                                      delegate:self
                             cancelButtonTitle:@"Ok"
                             otherButtonTitles:nil];
    [alert show];
}
@end
