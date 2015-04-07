//
//  ViewController.m
//  SchoolAgenda
//
//  Created by Alejandra B on 10/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "Home.h"
#import "cellAgenda.h"

NSMutableArray *arrayUser;

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self cfgiAdBanner];
    [self datosPerfil];
    }

- (void)didReceiveMemoryWarning {
    //[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) datosPerfil{
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
  // [query fromLocalDatastore];
    
    [query getObjectInBackgroundWithId:@"fYltPV7pcV" block:^(PFObject *user, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        self.lblUser.text = user[@"username"];
        self.lblSchool.text = user[@"school"];
        PFFile *thePhoto = [user objectForKey:@"photo"];
        [thePhoto getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
         {
            NSData *imageFile = [thePhoto getData];
            self.imgBckg.image = [UIImage imageWithData:imageFile];
         }];
    }];
}
/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellAgenda";
    
    cellAgenda *cell = (cellAgenda *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"cellAgenda" bundle:nil] forCellReuseIdentifier:@"cellAgenda"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellAgenda"];
    }

    if (indexPath.row == 0)
    {
        cell.lblMenu.text = @"Materias";
        cell.imgMenu.image = [UIImage imageNamed:@"materia.png"];
    }
    else if (indexPath.row == 1)
    {
        cell.lblMenu.text = @"Horario";
        cell.imgMenu.image = [UIImage imageNamed:@"horario.png"];
    }
    else if (indexPath.row == 2)
    {
        cell.lblMenu.text = @"Eventos";
        cell.imgMenu.image = [UIImage imageNamed:@"eventos.png"];
    }
    else if (indexPath.row == 3)
    {
        cell.lblMenu.text = @"Calificaciones";
        cell.imgMenu.image = [UIImage imageNamed:@"calif.png"];
    }
   return cell;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.row == 0){
     [self performSegueWithIdentifier:@"segueHomeToSubjects" sender:self];}
    else if (indexPath.row == 1){
        [self performSegueWithIdentifier:@"segueHomeToHorario" sender:self];
}
    else if (indexPath.row == 2){
       [self performSegueWithIdentifier:@"segueHomeToListEvent" sender:self];
    }
    else if (indexPath.row == 3){
        [self performSegueWithIdentifier:@"segueHomeToCalif" sender:self];
    }

}
//-------------------------------------------------------------------------------

/**********************************************************************************************
 BANNER
 **********************************************************************************************/
- (void)cfgiAdBanner
{
    // Setup iAdView
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    
    //Tell the add view the origin depending on iPhone size
    CGRect adFrame      = adView.frame;
    adFrame.origin.y    = self.view.frame.size.height - 50;
   // NSLog(@"adFrame.origin.y: %f",adFrame.origin.y);
    adView.frame        = adFrame;
    
    [adView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    [self.view addSubview:adView];
    adView.delegate = self;
    adView.hidden = YES;
    self->bannerIsVisible = NO;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self->bannerIsVisible)
    {
        adView.hidden = NO;
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        [UIView commitAnimations];
        self->bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self->bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        [UIView commitAnimations];
        adView.hidden = YES;
        self->bannerIsVisible = NO;
    }
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"Banner view is beginning an ad action");
    BOOL shouldExecuteAction = YES;
    if (!willLeave && shouldExecuteAction)
    {
        // stop all interactive processes in the app
        // [video pause];
        // [audio pause];
    }
    return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    // resume everything you've stopped
    // [video resume];
    // [audio resume];
}
//-------------------------------------------------------------------------------
@end
