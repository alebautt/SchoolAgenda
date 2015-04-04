//
//  cellAgenda.m
//  SchoolAgenda
//
//  Created by Alejandra B on 11/03/15.
//  Copyright (c) 2015 alebautista. All rights reserved.
//

#import "cellAgenda.h"

@implementation cellAgenda

- (void)awakeFromNib {
    // Initialization code
     self.vCell.layer.borderColor =[UIColor clearColor].CGColor;
    self.vCell.layer.borderWidth =1;
    self.vCell.clipsToBounds = YES;
    self.vCell.layer.cornerRadius =9;
    
    self.cellSubj.layer.borderColor =[UIColor clearColor].CGColor;
    self.cellSubj.layer.borderWidth =1;
    self.cellSubj.clipsToBounds = YES;
    self.cellSubj.layer.cornerRadius =9;
    
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
