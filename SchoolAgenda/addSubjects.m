//
//  addSubjects.m
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "addSubjects.h"

UIAlertView *alert;
@interface addSubjects ()

@end

@implementation addSubjects

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
        [self alertaRegistro];
    }
    else{
        
        // Add a relation between the Post with objectId "1zEcyElZ80" and the comment
     //   myComment[@"Subjects"] = [PFObject objectWithoutDataWithClassName:@"idSubj" objectId:@"ar8iSJ3FxF"];
        
        PFObject *object = [PFObject objectWithClassName:@"Subjects"];
        object[@"subject"] = self.txtSubjects.text;
        object[@"teacher"] = self.txtNameTeach.text;
       // object[@"idSubj"] = [PFObject objectWithoutDataWithClassName:@"User" objectId:@"sFzdoBLOrc"];
        
      [object pinInBackground];
        [object saveInBackground];
        self.txtSubjects.text = nil;
        self.txtNameTeach.text = nil;
     }
}

-(void) alertaRegistro{
    alert = [[UIAlertView alloc] initWithTitle:@"Alerta"
                                       message: @"Ingresa una materia"
                                      delegate:self
                             cancelButtonTitle:@"Ok"
                             otherButtonTitles:nil];
    [alert show];
}

- (IBAction)btnCancel:(id)sender {
    [self performSegueWithIdentifier:@"segueAddSubToListSub" sender:self];

}
@end
