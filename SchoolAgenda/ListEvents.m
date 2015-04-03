//
//  ListEvents.m
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "ListEvents.h"
#import "cellAgenda.h"

UIAlertView     *alert;

@interface ListEvents ()

@end

@implementation ListEvents
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(retrieveFromParse)];

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
    if( arrayEvents.count > 0){
        self.lblMsg.text=@"";
    }
    else{ self.lblMsg.text=@"No hay registro de Eventos";}
    return arrayEvents.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

//-------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellEvent";
    cellAgenda *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempObject = [arrayEvents objectAtIndex:indexPath.row];
    cell.txtEvent.text = [tempObject objectForKey:@"event"];
     cell.txtDate.text = [tempObject objectForKey:@"fecha"];
    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self AlertClic];
}

//Deleting row from parse dot com
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    PFObject *object = [arrayEvents objectAtIndex:indexPath.row];
    [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        //[self refreshTable:nil];
    }];
}

//-------------------------------------------------------------------------------



-(void) AlertClic{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Estatus del vento"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Terminado", @"Pendiente", nil];
    [alert show];
}
/*
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){//Editar
        flagSub = 1;
        [self performSegueWithIdentifier:@"segueListSubToAddSubj" sender:self];
        
    }
    else if(buttonIndex==2){//eliminar
        //        [self Delet];
        
    }
}
*/


-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Events"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            arrayEvents = [[NSArray alloc] initWithArray:objects];
        }
        [tableView reloadData];
    }];
}
- (IBAction)btnCompartir:(id)sender {
  /*  if(arrayEvents.count==0)
    {
    self.lblMsg.text=@"No hay evento que compartir";
    }
    else{
    
        NSString                    *strMsg;
        NSArray                     *activityItems;
        UIImage                     *imgShare;
        UIActivityViewController    *actVC;
        
       // imgShare = [UIImage imageNamed:@"chavo.png"];
      //  strMsg = [self.lblSelectedName.text stringByAppendingString: @" fué seleccionado"];
        
        activityItems = @[imgShare, strMsg];
        
        //Init activity view controller
        actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
        
        [self presentViewController:actVC animated:YES completion:nil];

    }*/
    
}
@end
