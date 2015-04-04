//
//  ListEvents.m
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "ListEvents.h"
#import "cellAgenda.h"
#import "varGlobal.h"

//#import <QuartzCore/QuartzCore.h>

UIAlertView     *alert;

@interface ListEvents ()

@end

@implementation ListEvents
@synthesize tableView;
NSDate *date;
NSMutableArray *datos;
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
    datos = arrayEvents[indexPath.row];
    
    NSDate *fecha = [tempObject objectForKey:@"fecha"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *fecha_str = [dateFormatter stringFromDate:fecha];
     cell.txtDate.text = fecha_str;
    
   // cell.txtEvent.layer.borderColor = [[UIColor redColor] CGColor];
    cell.txtEvent.layer.borderColor =[UIColor redColor].CGColor;
    
    //[arrayEvents orderByAscending:@"fecha"];
    
    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *tempObject = [arrayEvents objectAtIndex:indexPath.row ];
    objectIdEvent = tempObject.objectId;
    NSLog(@"esto es id: %@",objectId);
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


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){//Editar
        [self UpdateStatus];
        
    }
   }

-(void) AlertClic{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Estatus del vento"
                                      delegate:self
                             cancelButtonTitle:@"Sigue pendiente"
                             otherButtonTitles:@"Terminado", nil];
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

-(void) UpdateStatus{
    PFQuery *query = [PFQuery queryWithClassName:@"Events"];
    [query getObjectInBackgroundWithId:objectIdEvent block:^(PFObject *subj, NSError *error) {
        subj[@"status"] = @1;
        [subj saveInBackground];
    }];
    
}

-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Events"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
         [query orderByAscending:@"fecha"];
        if (!error)
        {
            arrayEvents = [[NSArray alloc] initWithArray:objects];
        }
        // Sorts the results in ascending order by the score field
       
         [tableView reloadData];
    }];
    
    
}
- (IBAction)btnCompartir:(id)sender {
   if(arrayEvents.count==0)
    {
    self.lblMsg.text=@"No hay evento que compartir";
    }
    else{
        cellAgenda *cell;
        NSString                    *strMsg;
        NSArray                     *activityItems;
      //  UIImage                     *imgShare;
        UIActivityViewController    *actVC;
        
       // imgShare =  [UIImage imageWithData:[dato objectAtIndex:4]];
        strMsg = [NSString stringWithFormat: @"de mi agenda les comparto un evento: %@",datos];
        NSLog(@"%@", strMsg);
        
       // activityItems = @[imgShare, strMsg];
        
        //Init activity view controller
        actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
        
        [self presentViewController:actVC animated:YES completion:nil];


    
    }
    

}
- (IBAction)btnInfo:(id)sender {
    [self AlertClic];
}
@end
