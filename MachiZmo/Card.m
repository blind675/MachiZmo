//
//  Card.m
//  MachiZmo
//
//  Created by Catalin BORA on 11/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards {
    
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}


@end
