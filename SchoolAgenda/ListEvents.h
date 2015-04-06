//
//  ListEvents.h
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>

@interface ListEvents : UIViewController<UITableViewDelegate, UIApplicationDelegate>
{
    NSArray *arrayEvents;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
