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

UIAlertView     *alert;

@interface ListEvents ()
@end

@implementation ListEvents
@synthesize tableView;
NSDate *date;
NSMutableArray *datos;

- (void)viewDidLoad {
    [super viewDidLoad];
  //  cell.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.65 alpha:1];

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
   
    return arrayEvents.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

//-------------------------------------------------------------------------------


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellAgenda";
    cellAgenda *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempObject = [arrayEvents objectAtIndex:indexPath.row];
    cell.txtEvent.text = [tempObject objectForKey:@"event"];
     cell.txtDesc.text = [tempObject objectForKey:@"description"];
    datos = arrayEvents[indexPath.row];
    NSDate *fecha = [tempObject objectForKey:@"fecha"];

    NSString *stat = [tempObject objectForKey:@"status"];
    int value = [stat intValue];
      // NSLog(@"%@", (long)stat);

    if (value == 1) {
       
        cell.imgStatus.image = [UIImage imageNamed:@"term.png"];
      //  self.cellSubj.layer.borderColor =[UIColor clearColor].CGColor;
      //  cell.backgroundColor = [UIColor greenColor];
      // =[UIColor colorWithRed:0.95 green:0.95 blue:0.65 alpha:1];
        
      //  UIColor *altCellColor = [UIColor colorWithRed:243/255. green:13/255. blue:250/255. alpha:1];
        //cell.backgroundColor = altCellColor;
        
        NSLog(@"evento terminado");
    }else {
        cell.imgStatus.image = [UIImage imageNamed:@"noterm.png"];

        //cell.backgroundColor =  [UIColor clearColor];
    }
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *fecha_evt = [dateFormatter stringFromDate:fecha];
     cell.txtDate.text = fecha_evt;
    
 //   cell.txtEvent.layer.borderColor =[UIColor redColor].CGColor;
   // NSLog(@"carga");
    
    
    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *tempObject = [arrayEvents objectAtIndex:indexPath.row ];
    objectIdEvent = tempObject.objectId;
//    NSLog(@"esto es id: %@",objectId);
    [self AlertClic];
}

-(void) AlertClic{
    alert = [[UIAlertView alloc] initWithTitle:@"Agenda Escolar"
                                       message:@"Estatus del vento"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Actividad Completada", @"Eliminar", @"Compartir", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){//terminado
        [self UpdateStatus];
    }
    else if(buttonIndex==2){//eliminar
        [self DeleteParse];
          [self viewDidLoad];
    }
    else if(buttonIndex==3){
        if(arrayEvents.count==0)
        {
            NSLog(@"No hay evento que compartir");
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
}

-(void) UpdateStatus{
    PFQuery *query = [PFQuery queryWithClassName:@"Events"];
    [query getObjectInBackgroundWithId:objectIdEvent block:^(PFObject *subj, NSError *error) {
        subj[@"status"] = @1;
        [subj saveInBackground];
        [self viewDidLoad];

    }];
}

-(void) DeleteParse{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    PFObject *object = [arrayEvents objectAtIndex:indexPath.row ];
    [object deleteInBackground];
    [object saveInBackground];
    [self viewDidLoad];
}

-(void) retrieveFromParse{
    PFQuery *query =[PFQuery queryWithClassName:@"Events"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                 if (!error)
        {
            arrayEvents = [[NSArray alloc] initWithArray:objects];
            NSLog(@"entra");
        }
        [query orderByAscending:@"fecha"];
         [tableView reloadData];
    }];
}



@end
