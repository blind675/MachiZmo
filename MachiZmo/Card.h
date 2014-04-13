//
//  Card.h
//  MachiZmo
//
//  Created by Catalin BORA on 11/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMached) BOOL mached;

- (int) match:(NSArray *)otherCards;

@end
