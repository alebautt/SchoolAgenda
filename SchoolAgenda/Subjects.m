//
//  addSubjects.m
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Subjects.h"

UIAlertView *alert;
NSString *alerta;
@interface Subjects ()
@end

@implementation Subjects

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
        PFObject *object = [PFObject objectWithClassName:@"Subjects"];
        object[@"subject"] = self.txtSubjects.text;
        object[@"teacher"] = self.txtNameTeach.text;
  
        [object pinInBackground];
        [object saveInBackground];
        alerta=@"Guardado correctamente";
        [self alertaRegistro];
        self.txtSubjects.text = nil;
        self.txtNameTeach.text = nil;
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
@end
