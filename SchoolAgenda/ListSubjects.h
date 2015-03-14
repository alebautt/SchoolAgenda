//
//  ListSubjects.h
//  SchoolAgenda
//
//  Created by Alejandra B on 13/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ListSubjects : UIViewController<UITableViewDelegate>
{
  NSArray *arraySubjects;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
