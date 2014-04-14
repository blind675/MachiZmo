//
//  CardMatchingGame.h
//  MachiZmo
//
//  Created by Catalin BORA on 14/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated init
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly,nonatomic) NSInteger score;

@end
