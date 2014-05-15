//
//  CardGameViewController.m
//  MachiZmo
//
//  Created by Catalin BORA on 10/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:self.cardButtons.count usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}
- (IBAction)resetButtonPressed {
    // reset the cards
    [self.game resetCardsWithCount:self.cardButtons.count fromDeck:[self createDeck]];
    // reset the UI
    [self updateUI];
    self.statusLabel.text = @"Game reseted.";
    self.switchSegment.enabled = YES;
    
}
- (IBAction)switchMatchNumber:(id)sender {
    self.game.choose3Selected = !self.game.choose3Selected;
    if (self.game.choose3Selected) {
        self.statusLabel.text = @"Selected match 3 modes.";
    } else {
        self.statusLabel.text = @"Selected match 2 modes.";
    }
    
}

- (IBAction)touchCardButton:(UIButton *)sender {

    self.switchSegment.enabled = NO;
    int cardIndex = [self.cardButtons indexOfObject:sender];
    self.statusLabel.text = [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI{
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMached;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}
- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen?@"backImage":@"frontSide"];
}
@end
