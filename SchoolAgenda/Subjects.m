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
        NSLog(@"agregar materia");
        self.lblSave.text=@"Guardar";
    }
    else if(flagSub == 1)
    {
        NSLog(@"modifica materia");
        self.lblSave.text =@"Modificar";
    }
}

- (void)didReceiveMemoryWarning {
   // [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
        self.txtSubjects.text = nil;
        self.txtNameTeach.text = nil;
     }
}


-(void) SaveSubject{
    PFObject *object = [PFObject objectWithClassName:@"Subjects"];
    object[@"subject"] = self.txtSubjects.text;
    object[@"teacher"] = self.txtNameTeach.text;
    
    [object pinInBackground];
    [object saveInBackground];
    alerta=@"Guardado correctamente";
}

-(void) EditSubject{
    PFQuery *query = [PFQuery queryWithClassName:@"Subjects"];
    [query getObjectInBackgroundWithId:@"LPDo9XOXlD" block:^(PFObject *subj, NSError *error) {
        subj[@"subject"] = self.txtSubjects;
        subj[@"teacher"] = self.txtNameTeach.text;
        [subj pinInBackground];
        [subj saveInBackground];
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
