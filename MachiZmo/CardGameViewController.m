//
//  CardGameViewController.m
//  MachiZmo
//
//  Created by Catalin BORA on 10/04/14.
//  Copyright (c) 2014 Bob's Game House. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong,nonatomic) PlayingCardDeck *cardsDeck;

@end

@implementation CardGameViewController

-(void) setFlipCount:(int)flipCount {
    _flipCount=flipCount;
    self.flipsLabel.text= [NSString stringWithFormat:@"Flips: %d",flipCount];
}
- (IBAction)touchCardButton:(UIButton *)sender {

    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"frontSide"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"backImage"]
                          forState:UIControlStateNormal];
        PlayingCard *aRandomCard = (PlayingCard *) [self.cardsDeck drawRandomCard];
        [sender setTitle:[aRandomCard.suit stringByAppendingString: [PlayingCard rankStrings][aRandomCard.rank]] forState:UIControlStateNormal];
    }
    self.flipCount++;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (PlayingCardDeck *)cardsDeck{
    if (_cardsDeck == nil) {
        _cardsDeck = [[PlayingCardDeck alloc]init];
    }
    return _cardsDeck;
}
@end
