//
//  horario.m
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "ListHorario.h"
#import "cellAgenda.h"

@interface ListHorario ()

@end

@implementation ListHorario
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
    cell.lblMVie.text = [tempObject objectForKey:@"viernes"];
    
    return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // PFObject *tempObject = [arraySubjects objectAtIndex:indexPath.row ];
  //  objectId = tempObject.objectId;
    // NSLog(@"esto es id: %@",objectId);
    //[self AlertClic];
}

//-------------------------------------------------------------------------------
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


@end
