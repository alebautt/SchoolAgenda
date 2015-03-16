//
//  cellAgenda.h
//  SchoolAgenda
//
//  Created by Alejandra B on 11/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import <UIKit/UIKit.h>

//home
@interface cellAgenda : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgMenu;
@property (strong, nonatomic) IBOutlet UILabel *lblMenu;
@property (strong, nonatomic) IBOutlet UIView *vCell;

//ListSubjects

@property (strong, nonatomic) IBOutlet UILabel *lblSubjects;

@property (strong, nonatomic) IBOutlet UIView *cellSubj;

@end
