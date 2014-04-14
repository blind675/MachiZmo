//
//  CardMatchingGame.m
//  MachiZmo
//
//  Created by Catalin BORA on 14/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(readwrite,nonatomic) NSInteger score;
@property(strong,nonatomic)NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards=[[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self) {
        for (int i=0; i < count; i++) {
            Card *randomCard = [deck drawRandomCard];
            if (randomCard) {
                [self.cards addObject:randomCard];
            } else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index<self.cards.count) ? self.cards[index] : nil;
}

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMached) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match 2 cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMached) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.mached = YES;
                        otherCard.mached = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
    }
}

@end
