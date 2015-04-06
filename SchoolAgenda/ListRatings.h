//
//  ListRatings.h
//  SchoolAgenda
//
//  Created by Alejandra B on 05/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ListRatings : UIViewController<UITableViewDelegate, UIApplicationDelegate>
{
    NSArray *arrayRatings;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
