//
//  Deck.h
//  MachiZmo
//
//  Created by Catalin BORA on 11/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
