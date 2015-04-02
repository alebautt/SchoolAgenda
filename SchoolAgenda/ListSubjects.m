//
//  ListSubjects.m
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "ListSubjects.h"
#import "cellAgenda.h"


@interface ListSubjects ()

@end

@implementation ListSubjects
@synthesize tableView;
NSString *seleccionado;

UIAlertView     *alert;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(retrieveFromParse)];
//[query unpinInBackground];
    
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

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //  return arraySubjects.count;
    if( arraySubjects.count > 0){
        self.lblMsg.text=@"";
    }
    else{ self.lblMsg.text=@"No hay registro de Materias";}
  return arraySubjects.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

//-------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellAgenda";
    cellAgenda *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempObject = [arraySubjects objectAtIndex:indexPath.row];
    cell.lblSubject.text = [tempObject objectForKey:@"subject"];
    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   seleccionado = indexPath.row;
    seleccionado = [arraySubjects objectAtIndex:0];
    
    
    
  //  sele   = [datos objectAtIndex:0];

   //[self AlertClic];
    NSLog(@"%@ selec", seleccionado);
    
  
}

-(void) AlertClic{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Materia seleccionada"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Editar", @"Eliminar", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){//Editar
        [self performSegueWithIdentifier:@"segueListSubToEditSub" sender:self];

          }
    else if(buttonIndex==2){//eliminar
               [self Delet];

    }
  }

-(void)Delet{
    
     //  BOOL success = NO;
   // success = [[ClassDataBase getSharedInstance]
     //          deleteData:idee];
    
   /*
    recupero un dato*****/
    
  /*  PFQuery *query = [PFQuery queryWithClassName:@"Subjects"];
    [query getObjectInBackgroundWithId:@"DeTftJVJbA" block:^(PFObject *Subjects, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", Subjects);
        int score = [[Subjects objectForKey:@"Subjects"] intValue];
           NSLog(@"%d", score);
    }];*/
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Subjects"];
    [query whereKey:@"objectId" equalTo:@"DeTftJVJbA"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

}


-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Subjects"];
    //[query unpinInBackground];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            arraySubjects = [[NSArray alloc] initWithArray:objects];
        }
        [tableView reloadData];
    }];
  
}
@end
