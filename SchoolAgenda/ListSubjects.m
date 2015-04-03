//
//  ListSubjects.m
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "ListSubjects.h"
#import "cellAgenda.h"
#import "Parse/Parse.h"
#import <ParseUI/PFTableViewCell.h>
#import <ParseUI/PFQueryTableViewController.h>
//#import "Subjects.h"
#import "varGlobal.h"

@interface ListSubjects ()
@end
@implementation ListSubjects
@synthesize tableView;
NSString *seleccionado;
NSString *objectId;
UIAlertView *alert;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(retrieveFromParse)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    [self AlertClic];
   // NSString *idSub;
    PFObject *tempObject = [arraySubjects objectAtIndex:indexPath.row ];
    objectId = tempObject.objectId;
    NSLog(@"esto es id: %@",objectId);
}



//-------------------------------------------------------------------------------

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
        flagSub = 1;
        [self performSegueWithIdentifier:@"segueListSubToAddSubj" sender:self];
        PFQuery *query = [PFQuery queryWithClassName:@"Subjects"];
        [query getObjectInBackgroundWithId:arraySubjects  block:^(PFObject *gameScore, NSError *error) {
            // Do something with the returned PFObject in the gameScore variable.
            NSLog(@"%@", gameScore);
        }];
    }
    else if(buttonIndex==2){//eliminar
 //       UITableViewCell *cell = (UITableViewCell*);
       // NSIndexPath *indexPath = [tableView indexPathForCell:cell];
        
  
    }
}


-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Subjects"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            arraySubjects = [[NSArray alloc] initWithArray:objects];
        }
        [tableView reloadData];
    }];
}

- (IBAction)nbtnAdd:(id)sender {
    flagSub = 0;
    
}
@end
