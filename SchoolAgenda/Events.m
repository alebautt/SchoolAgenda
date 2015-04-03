//
//  AddEvents.m
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Events.h"
UIAlertView *alert;
NSString *alerta;

@interface Events ()

@end

@implementation Events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    if([self.txtEvent.text isEqualToString:@""]){
        alerta=@"Verifica que hayas ingresado un evento";
        [self alertaRegistro];
    }
    else{
        [self SaveEvent];
        [self alertaRegistro];
        self.txtEvent.text = nil;
        self.txtDescription.text = nil;
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

-(void) SaveEvent{
    PFObject *object = [PFObject objectWithClassName:@"Events"];
    object[@"event"] = self.txtEvent.text;
    object[@"description"] = self.txtDescription.text;
    object[@"fecha"] = self.dpFecha.date;
    
    
    
    NSDate *date = [NSDate date];
  //  NSData *data = [@"foo" dataUsingEncoding:NSUTF8StringEncoding];
    
    [object pinInBackground];
    [object saveInBackground];
    alerta=@"Guardado correctamente";
}
@end
