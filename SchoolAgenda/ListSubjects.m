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
#import "varGlobal.h"

@interface ListSubjects ()
@end
@implementation ListSubjects

@synthesize tableView;
NSString *seleccionado;

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
    PFObject *tempObject = [arraySubjects objectAtIndex:indexPath.row ];
    objectId = tempObject.objectId;
   // NSLog(@"esto es id: %@",objectId);
        [self AlertClic];
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
        [self EditParse];
         flagSub = 1;
        [self performSegueWithIdentifier:@"segueListSubToAddSubj" sender:self];
             }
    else if(buttonIndex==2){//eliminar
        [self DeleteParse];
        [self viewDidLoad];

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

-(void) EditParse{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [arraySubjects objectAtIndex:indexPath.row ];
    SubjName = [object objectForKey:@"subject"];
    SubjTeacher = [object objectForKey:@"teacher"];
}

-(void) DeleteParse{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [arraySubjects objectAtIndex:indexPath.row ];
    [object deleteInBackground];
    [object saveInBackground];
  }

- (IBAction)nbtnAdd:(id)sender {
    flagSub = 0;
    NSLog(@"Entrando a add");

      [self performSegueWithIdentifier:@"segueListSubToAddSubj" sender:self];
   }

@end
