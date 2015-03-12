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
    self.vCell.layer.cornerRadius =8;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
