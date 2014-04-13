//
//  Deck.m
//  MachiZmo
//
//  Created by Catalin BORA on 11/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *)cards{
    
    if (!_cards) {
        _cards=[[NSMutableArray alloc]init];
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{
    Card *randromCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randromCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randromCard;
}

@end
