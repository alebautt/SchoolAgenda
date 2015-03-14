//
//  ViewController.h
//  SchoolAgenda
//
//  Created by Alejandra B on 10/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <Parse/Parse.h>

@interface home : UIViewController<ADBannerViewDelegate, UIApplicationDelegate>
{
    ADBannerView *adView;
    BOOL bannerIsVisible;
}

@property (strong, nonatomic) IBOutlet UITableView *tblMain;

@property (strong, nonatomic) IBOutlet UIImageView *imgBckg;
@property (strong, nonatomic) IBOutlet UILabel *lblUser;
@property (strong, nonatomic) IBOutlet UILabel *lblSchool;
@end

