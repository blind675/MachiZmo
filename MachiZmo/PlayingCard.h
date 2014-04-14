//
//  PlaingCard.h
//  MachiZmo
//
//  Created by Catalin BORA on 11/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuit;
+ (NSUInteger)maxRank;

@end
