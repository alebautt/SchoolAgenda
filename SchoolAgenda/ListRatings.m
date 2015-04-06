//
//  ListRatings.m
//  SchoolAgenda
//
//  Created by Alejandra B on 05/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "ListRatings.h"
#import "cellAgenda.h"
#import "Parse/Parse.h"
#import <ParseUI/PFTableViewCell.h>
#import <ParseUI/PFQueryTableViewController.h>
@interface ListRatings ()

@end


@implementation ListRatings

@synthesize tableView;
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
    return arrayRatings.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

//-------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellAgenda";
    cellAgenda *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempObject = [arrayRatings objectAtIndex:indexPath.row];
    cell.lblMat.text = [tempObject objectForKey:@"materia"];

  //  cell.lblMateria.text = [tempObject objectForKey:@"materia"];
 //   cell.lblCalif.text = [tempObject objectForKey:@"calificaciones"];

    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //PFObject *tempObject = [arrayRatings objectAtIndex:indexPath.row ];
    //objectId = tempObject.objectId;
   // NSLog(@"esto es id: %@",objectId);
    [self AlertClic];
}

//-------------------------------------------------------------------------------


-(void) AlertClic{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Calificacion seleccionada"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Eliminar", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){//eliminar
        [self DeleteParse];
    }
}

-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Ratings"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            arrayRatings = [[NSArray alloc] initWithArray:objects];
        }
        [tableView reloadData];
    }];
}

-(void) DeleteParse{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [arrayRatings objectAtIndex:indexPath.row ];
    [object deleteInBackground];
    [object saveInBackground];
    [self viewDidLoad];
}

@end
