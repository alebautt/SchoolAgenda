//
//  Registro.m
//  SchoolAgenda
//
//  Created by Alejandra B on 12/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "addUser.h"

UIImage *choseImg;

@interface addUser ()
@end

UIAlertView *alert;
NSString *alerta;
@implementation addUser

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
       if([self.txtName.text isEqualToString:@""] ||[self.txtEmail.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""]){
           alerta=@"Es necesario ingresar los campos";
           [self AlertRegistro];
    }
        else{
            PFObject *object = [PFObject objectWithClassName:@"User"];
            
            object[@"username"] = self.txtName.text;
            object[@"email"] = self.txtEmail.text;
            object[@"password"] = self.txtPassword.text;
            object[@"school"] = self.txtSchool.text;
            
            NSData *imageData = UIImagePNGRepresentation(choseImg);
            PFFile *imageFile = [PFFile fileWithName:@"photo.png" data:imageData];
        
            object[@"photo"]=imageFile;
            [object pinInBackground];
            [object saveInBackground];
            
            alerta=@"Guardado correctamente";
            [self AlertRegistro];
            
            self.txtName.text = nil;
            self.txtEmail.text = nil;
            self.txtPassword.text = nil;
            self.txtSchool.text = nil;
            self.imgPhoto = nil;
            [self performSegueWithIdentifier:@"segueUserToHome" sender:self];
        }
}

- (IBAction)btnCancel:(id)sender {
}

- (IBAction)btnFoto:(id)sender {
    [self AlertCamera];
}

-(void) AlertCamera{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Seleccionar foto"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Camara",@"Carrete",nil];
    [alert show];
}

-(void) AlertRegistro{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:alerta
                                      delegate:self
                             cancelButtonTitle:@"Aceptar"
                             otherButtonTitles:nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    if(buttonIndex==1)//camara
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
    }
    
    else if(buttonIndex==2)//carrete
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:NULL];
    }
   }

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    choseImg = info[UIImagePickerControllerEditedImage];
    self.imgPhoto.image = choseImg;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
