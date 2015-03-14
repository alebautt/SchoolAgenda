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
    return arraySubjects.count;

}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//-------------------------------------------------------------------------------



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    
    
 /*
    static NSString *CellIdentifier = @"CellResults";
    CellResults *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempObject = [arrayLugares objectAtIndex:indexPath.row];
    cell.lblName.text = [tempObject objectForKey:@"name"];
    return cell;
    
    
    */
    
    
    
    
    
    
    static NSString *CellIdentifier = @"cellSubjects";
    
    cellAgenda *cell = (cellAgenda *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[cellAgenda alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.lblSubjects.text = [object objectForKey:@"subject"];
    return cell;
}


-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell seleccionado");
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


@end
