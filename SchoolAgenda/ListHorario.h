//
//  horario.h
//  SchoolAgenda
//
//  Created by Alejandra B on 01/04/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ListHorario : UIViewController<UITableViewDelegate, UIApplicationDelegate>
{
    NSArray *arraySubjects;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
