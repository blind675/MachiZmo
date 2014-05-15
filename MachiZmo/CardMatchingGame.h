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
- (NSString *)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)resetCardsWithCount:(NSUInteger)count fromDeck:(Deck *)deck;

@property (readonly,nonatomic) NSInteger score;
@property (nonatomic) BOOL choose3Selected;

@end
