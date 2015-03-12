//
//  ViewController.h
//  SchoolAgenda
//
//  Created by Alejandra B on 10/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface vcMenu : UIViewController
<UIAccelerometerDelegate, UITableViewDelegate>
{
    ADBannerView *adView;
    BOOL bannerIsVisible;
}

@property (strong, nonatomic) IBOutlet UITableView *tblMain;

@property (strong, nonatomic) IBOutlet UIView *vCell;

@end

