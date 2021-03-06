//
//  PlaingCard.m
//  MachiZmo
//
//  Created by Catalin BORA on 11/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSInteger)match:(NSArray *)otherCards{
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *card = [otherCards firstObject];
        if ([self.suit isEqualToString:card.suit]) {
            score = 1;
        } else if( self.rank == card.rank){
            score = 4;
        }
    }
    
    return score;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit; // needed because we implemented the setter AND getter

+ (NSArray *)validSuit{
    return @[@"♥︎",@"♦︎",@"♣︎",@"♠︎"];
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuit] containsObject:suit]) {
        _suit=suit;
    }
}
- (NSString *)suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{ return [[self rankStrings] count]-1;}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
